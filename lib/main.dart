import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logging/logging.dart';
import 'package:troop/app/repo_container.dart';
import 'app/utils.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app/app.dart';

final logger = Logger('App');

void main() async {
  setupLogger(logger);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  RepoContainer.authRepository =
      AuthenticationRepository(firebaseAuth: FirebaseAuth.instance);

  runApp(
    const ProviderScope(
      child: TroopApp(),
    ),
  );
}
