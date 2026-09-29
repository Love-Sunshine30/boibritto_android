import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../profile/application/complete_profile_controller.dart';

class CompleteProfileScreen extends ConsumerStatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  ConsumerState<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends ConsumerState<CompleteProfileScreen> {
  final _whatsappController = TextEditingController();

  @override
  void dispose() {
    _whatsappController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final number = _whatsappController.text.trim();
    if (number.isEmpty) return;
    final ok = await ref
        .read(completeProfileControllerProvider.notifier)
        .submitWhatsappNumber(number);
    // On success, app_router.dart's redirect re-runs automatically and
    // moves off /complete-profile.
    if (!ok && mounted) {
      final message = ref.read(completeProfileControllerProvider).errorMessage;
      if (message != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(completeProfileControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('One more thing')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add a WhatsApp number so borrowers and owners can reach '
                    'you to arrange a handoff.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  AppTextField(
                    label: 'WhatsApp number',
                    controller: _whatsappController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(label: 'Continue', loading: state.submitting, onPressed: _submit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}