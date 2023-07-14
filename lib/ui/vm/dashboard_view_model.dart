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
  final String _visited = "";
  final ActiveLevelType _activeLevelType = const ActiveLevelType.success();

  String get visited => _visited;

  late final UseCases _useCases = _reader(useCasesProvider);

  void visiting(List<User> members) async {
    notifyListeners();
  }

  void detectActiveLevelType() {}

  void _subtrackDate(String date) {
    print("date : $date");
    final prevMs =
        Day.fromString(date).diff(Day.fromDateTime(DateTime.now()), "h");
    print("here : $prevMs");
  }
}
