import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/auth/auth_state.dart';
import '../../../core/providers/firebase_providers.dart';
import '../data/models/own_profile.dart';
import '../data/profile_repository.dart';

/// Loads once the user is actually signed in — never fires GET /me while
/// signed out. `ref.watch(authStateProvider.future)` both gates that and
/// makes this rebuild automatically on login/logout.
class OwnProfileController extends AsyncNotifier<OwnProfile> {
  @override
  Future<OwnProfile> build() async {
    final auth = await ref.watch(authStateProvider.future);
    if (auth is! AuthAuthenticated) {
      // app_router.dart's redirect only reads this provider in the
      // AuthAuthenticated branch, so this error is never actually surfaced
      // to the user — it just means "not applicable right now."
      throw StateError('OwnProfileController read while signed out');
    }
    return ref.read(profileRepositoryProvider).getOwnProfile();
  }

  Future<void> refresh() async {
    state = const AsyncLoading<OwnProfile>().copyWithPrevious(state);
    state = await AsyncValue.guard(
      () => ref.read(profileRepositoryProvider).getOwnProfile(),
    );
  }
}

final ownProfileControllerProvider =
    AsyncNotifierProvider<OwnProfileController, OwnProfile>(OwnProfileController.new);