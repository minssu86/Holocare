import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:holocare/firebase_options.dart';
import 'package:holocare/holocare.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // env load
    await dotenv.load(fileName: ".env");
    // Firebase
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    runApp(const ProviderScope(child: Holocare()));
  }, (error, stack) {
    print(error);
  });
}
