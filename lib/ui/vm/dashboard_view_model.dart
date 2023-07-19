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
    final protege = members.where((member) => member.role == Role.protege.role);
    if (protege.isEmpty) return;
    final target = protege.first;
    if (target.visitedAt != null) {
      _visitedAt = Day.fromString(target.visitedAt!).format("YY.MM.DD HH:mm");
      _diff = DateTime.parse(target.visitedAt!)
          .difference(DateTime.now())
          .inHours
          .abs()
          .toString();
    }
    changeActiveLevelType(target.pause ? double.infinity : num.parse(_diff));
    notifyListeners();
  }

  void changeActiveLevelType(num diff) {
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
