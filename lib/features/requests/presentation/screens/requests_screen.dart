import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../app/theme/app_spacing.dart';
import '../../../../core/widgets/status_pill.dart';
import '../../application/incoming_requests_controller.dart';
import '../../application/sent_requests_controller.dart';
import '../../data/models/borrow_request.dart';
import '../widgets/request_status_x.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Requests'),
          bottom: const TabBar(tabs: [Tab(text: 'Sent'), Tab(text: 'Incoming')]),
        ),
        body: const TabBarView(children: [_SentTab(), _IncomingTab()]),
      ),
    );
  }
}

class _SentTab extends ConsumerWidget {
  const _SentTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(sentRequestsControllerProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text("Couldn't load requests: $err")),
      data: (requests) {
        if (requests.isEmpty) {
          return const Center(child: Text("You haven't requested any books."));
        }
        return RefreshIndicator(
          onRefresh: () => ref.read(sentRequestsControllerProvider.notifier).refresh(),
          child: _RequestList(requests: requests, subtitleBuilder: (r) => 'Owner listing'),
        );
      },
    );
  }
}

class _IncomingTab extends ConsumerWidget {
  const _IncomingTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(incomingRequestsControllerProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, _) => Center(child: Text("Couldn't load requests: $err")),
      data: (requests) {
        if (requests.isEmpty) return const Center(child: Text('No incoming requests.'));
        return RefreshIndicator(
          onRefresh: () => ref.read(incomingRequestsControllerProvider.notifier).refresh(),
          child: _RequestList(
            requests: requests,
            subtitleBuilder: (r) => 'From ${r.requesterName}',
          ),
        );
      },
    );
  }
}

class _RequestList extends StatelessWidget {
  const _RequestList({required this.requests, required this.subtitleBuilder});
  final List<BorrowRequest> requests;
  final String Function(BorrowRequest) subtitleBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final r = requests[index];
        return Card(
          child: ListTile(
            title: Text(r.bookTitle),
            subtitle: Text(subtitleBuilder(r)),
            trailing: StatusPill(label: r.status.label, tone: r.status.tone),
            onTap: () => context.push(AppRoutes.requestDetail(r.id)),
          ),
        );
      },
    );
  }
}