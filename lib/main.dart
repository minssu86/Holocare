import 'dart:async';
import 'package:flutter/material.dart';
import 'package:holocare/holocare.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(() {
    runApp(const ProviderScope(child: Holocare()));
  }, (error, stack) {
    print(error);
  });
}
