import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('[firebase] project=${Firebase.app().options.projectId}');

  // Temporary diagnostic: remove once the spinner issue is solved.
  FirebaseAuth.instance.authStateChanges().listen(
    (u) => debugPrint('[raw auth] user=${u?.uid}'),
    onError: (e) => debugPrint('[raw auth] error=$e'),
  );

  runApp(const ProviderScope(child: BoibrittoApp()));
}