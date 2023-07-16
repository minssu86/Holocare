import 'package:day/day.dart';
import 'package:flutter/material.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dashboardViewModelProvider = Provider((_) => DashboardViewModel());

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel();

  String hour = "";
  String _visitedAt = "";
  String _diff = "0";
  ActiveLevel _activeLevel = ActiveLevel.success;

  String get visited => _visitedAt;
  String get diff => _diff;
  ActiveLevel get activeLevel => _activeLevel;

  void visiting(List<User> members) async {
    if (members.isEmpty) return;
    final protege =
        members.where((member) => member.role == Role.protege.role).first;
    if (protege.visitedAt != null) {
      _visitedAt = Day.fromString(protege.visitedAt!).format("YY.MM.DD HH:mm");
      _diff = DateTime.parse(protege.visitedAt!)
          .difference(DateTime.now())
          .inHours
          .abs()
          .toString();
    }
    _detectActiveLevelType(num.parse(_diff));
    notifyListeners();
  }

  void _detectActiveLevelType(num diff) {
    if (diff <= ActiveLevel.success.level) {
      _activeLevel = ActiveLevel.success;
    }
    if (diff > ActiveLevel.success.level && diff <= ActiveLevel.caution.level) {
      _activeLevel = ActiveLevel.caution;
    }
    if (diff >= ActiveLevel.warning.level) {
      _activeLevel = ActiveLevel.warning;
    }
    if (diff == ActiveLevel.pause.level) {
      _activeLevel = ActiveLevel.pause;
    }
  }
}
