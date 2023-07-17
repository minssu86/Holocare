import 'package:flutter/material.dart';
import 'package:holocare/domain/use_case/use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingViewModelProvider =
    ChangeNotifierProvider((ref) => SettingViewModel(ref.read));

class SettingViewModel extends ChangeNotifier {
  final dynamic _reader;

  SettingViewModel(this._reader) {
    _getStorage().then((value) {
      if (value.containsKey("pause")) updatePause(value['pause']);
    });
  }

  late final UseCases _useCases = _reader(useCasesProvider);

  bool _pause = false;

  bool get pause => _pause;

  void updatePause(bool condition) async {
    final data = await _getStorage();
    data.update("pause", (_) => condition);
    _useCases.updateStorage(data);
    _pause = condition;
    notifyListeners();
  }

  Future<Map<String, dynamic>> _getStorage() async {
    return await _useCases.getStorage().then((value) => Map.from(value!));
  }
}
