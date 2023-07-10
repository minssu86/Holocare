import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rootViewModelProvider = Provider((_) => RootViewModel());

class RootViewModel extends ChangeNotifier {
  RootViewModel();

  String? _code;

  get code => _code;

  void changeCode(pin) {
    _code = pin;
    notifyListeners();
  }
}
