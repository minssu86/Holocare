import 'package:flutter/material.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final rootViewModelProvider = ChangeNotifierProvider((_) => RootViewModel());

class RootViewModel extends ChangeNotifier {
  RootViewModel();

  String? _code;
  Role? _role;

  get code => _code;
  Role? get role => _role;
  bool get isProtege => _role?.role == Role.protege.role ? true : false;
  bool get isProtector => _role?.role == Role.protector.role ? true : false;
  bool get isNotEmptyCode => _code != null && _code?.length == 7;

  void changeRole(Role role) {
    _role = role;
    notifyListeners();
  }

  void changeCode(pin) {
    _code = pin;
    notifyListeners();
  }
}
