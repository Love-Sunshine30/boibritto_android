import 'package:flutter/material.dart';

/// Placeholder — the real form (WhatsApp number field, PATCH /me) needs
/// features/profile's repository, landing in step 3. Exists now only so
/// app_router.dart has somewhere to point once the profile-completeness
/// redirect is wired up.
class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Complete profile — coming in step 3')));
  }
}