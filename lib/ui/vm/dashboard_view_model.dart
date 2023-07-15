import 'package:day/day.dart';
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

  String hour = "";
  String _visitedAt = "";
  String _diff = "0";

  final ActiveLevelType _activeLevelType = const ActiveLevelType.success();

  String get visited => _visitedAt;
  String get diff => _diff;

  late final UseCases _useCases = _reader(useCasesProvider);

  void visiting(List<User> members) async {
    final protege =
        members.where((member) => member.role == Role.protege.role).first;
    if (protege.visitedAt != null) {
      _visitedAt = Day.fromString(protege.visitedAt!).format("YY.MM.DD HH:mm");
      _diff = DateTime.parse(protege.visitedAt!)
          .difference(DateTime.now())
          .inHours
          .toString();
    }
    notifyListeners();
  }

  void detectActiveLevelType() {}

  void _subtrackDate(String date) {}
}
