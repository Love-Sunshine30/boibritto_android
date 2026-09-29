import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/errors/failure.dart';
import '../data/profile_repository.dart';
import 'own_profile_controller.dart';

class ProfileActionState {
  const ProfileActionState({this.submitting = false, this.errorMessage});
  final bool submitting;
  final String? errorMessage;

  ProfileActionState copyWith({bool? submitting, String? errorMessage}) {
    return ProfileActionState(
      submitting: submitting ?? this.submitting,
      errorMessage: errorMessage,
    );
  }
}

class CompleteProfileController extends Notifier<ProfileActionState> {
  @override
  ProfileActionState build() => const ProfileActionState();

  Future<bool> submitWhatsappNumber(String whatsappNumber) async {
    state = state.copyWith(submitting: true, errorMessage: null);
    try {
      await ref.read(profileRepositoryProvider).updateWhatsappNumber(whatsappNumber);
      // Refetch so app_router.dart's redirect sees the update immediately.
      ref.invalidate(ownProfileControllerProvider);
      state = state.copyWith(submitting: false);
      return true;
    } catch (e) {
      final failure = Failure.from(e);
      state = state.copyWith(
        submitting: false,
        errorMessage: failure is ValidationFailure
            ? failure.message
            : 'Something went wrong. Please try again.',
      );
      return false;
    }
  }
}

final completeProfileControllerProvider =
    NotifierProvider<CompleteProfileController, ProfileActionState>(
  CompleteProfileController.new,
);