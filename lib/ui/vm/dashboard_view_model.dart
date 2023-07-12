import 'package:flutter/material.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/use_case/use_case.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:holocare/foundation/type/active_level_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dashboardViewModelProvider =
    Provider((ref) => DashboardViewModel(ref.read));

class DashboardViewModel extends ChangeNotifier {
  final dynamic _reader;

  DashboardViewModel(this._reader);

  String _visited = "";
  final ActiveLevelType _activeLevelType = const ActiveLevelType.success();

  String get visited => _visited;

  late final UseCases _useCases = _reader(useCasesProvider);

  void visiting(List<User> members) async {
    final protege =
        members.where((member) => member.role == Role.protege.role).first;
    if (protege.visited == null) {
      _visited = "존재하지 않습니다";
    } else {
      _visited = protege.visited!;
    }
    notifyListeners();
  }

  void detectActiveLevelType() {}
}
