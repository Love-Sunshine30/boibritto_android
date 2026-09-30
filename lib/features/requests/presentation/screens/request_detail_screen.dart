import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/status_pill.dart';
import '../../../profile/application/own_profile_controller.dart';
import '../../application/request_action_controller.dart';
import '../../application/request_detail_controller.dart';
import '../../data/models/borrow_request.dart';
import '../widgets/request_status_x.dart';

class RequestDetailScreen extends ConsumerWidget {
  const RequestDetailScreen({super.key, required this.requestId});
  final int requestId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requestAsync = ref.watch(requestDetailControllerProvider(requestId));
    final myId = ref.watch(ownProfileControllerProvider).maybeWhen(
      data: (profile) => profile.user.id,
      orElse: () => null,
    );
    final actionState = ref.watch(requestActionControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Request')),
      body: requestAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Couldn't load this request: $err")),
        data: (request) {
          final isOwner = myId != null && myId == request.ownerId;
          final isRequester = myId != null && myId == request.requesterId;
          final canMessage =
              request.status != RequestStatus.pending && request.status != RequestStatus.rejected;

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(request.bookTitle, style: Theme.of(context).textTheme.titleLarge),
                    ),
                    StatusPill(label: request.status.label, tone: request.status.tone),
                  ],
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(isOwner ? 'Requested by ${request.requesterName}' : 'Your request'),
                if (request.message.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.md),
                  Text(request.message, style: Theme.of(context).textTheme.bodyMedium),
                ],
                if (canMessage) ...[
                  const SizedBox(height: AppSpacing.md),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.chat_bubble_outline),
                    label: Text(isOwner ? 'Message ${request.requesterName}' : 'Message owner'),
                    onPressed: () => context.push(AppRoutes.threadDetail(request.id)),
                  ),
                ],
                const SizedBox(height: AppSpacing.xl),
                _ActionArea(
                  request: request,
                  isOwner: isOwner,
                  isRequester: isRequester,
                  submitting: actionState.submitting,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ActionArea extends ConsumerWidget {
  const _ActionArea({
    required this.request,
    required this.isOwner,
    required this.isRequester,
    required this.submitting,
  });

  final BorrowRequest request;
  final bool isOwner;
  final bool isRequester;
  final bool submitting;

  Future<void> _handle(
    BuildContext context,
    WidgetRef ref,
    Future<bool> Function() action,
  ) async {
    final ok = await action();
    if (!ok && context.mounted) {
      final message = ref.read(requestActionControllerProvider).errorMessage;
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(requestActionControllerProvider.notifier);

    if (request.status == RequestStatus.pending && isOwner) {
      return Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'Reject',
              variant: AppButtonVariant.tonal,
              loading: submitting,
              onPressed: () => _handle(context, ref, () => notifier.reject(request.id)),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: AppButton(
              label: 'Accept',
              loading: submitting,
              onPressed: () => _handle(context, ref, () => notifier.accept(request.id)),
            ),
          ),
        ],
      );
    }

    if (request.status == RequestStatus.accepted) {
      final myConfirmed = isOwner ? request.ownerConfirmed : request.borrowerConfirmed;
      if (myConfirmed) {
        return const Chip(label: Text('Waiting on the other side to confirm'));
      }
      if (isOwner || isRequester) {
        return AppButton(
          label: isOwner ? "I've handed it over" : "I've received it",
          loading: submitting,
          onPressed: () => _handle(context, ref, () => notifier.confirmHandoff(request.id)),
        );
      }
    }

    if (request.status == RequestStatus.active && isOwner) {
      return AppButton(
        label: 'Mark as returned',
        loading: submitting,
        onPressed: () => _handle(context, ref, () => notifier.markReturned(request.id)),
      );
    }

    return const SizedBox.shrink();
  }
}