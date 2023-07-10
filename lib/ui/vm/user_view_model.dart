import 'package:flutter/foundation.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/use_case/use_case.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:holocare/foundation/extension/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final userViewModelProvider =
    ChangeNotifierProvider((ref) => UserViewModel(ref.read));

class UserViewModel extends ChangeNotifier {
  final dynamic _reader;

  UserViewModel(this._reader) {
    _getLocalUser();
  }

  late final UseCases _useCases = _reader(useCasesProvider);

  User? _user;

  User? get user => _user;

  bool get isVerified => _user != null;

  Future<void> updateRole(Role role) async {
    await _useCases.createLocalUser(
      User(
        uuid: const Uuid().v4(),
        role: role.role,
        verified: "true",
        code: Utils.generateCode(),
      ),
    );
    await _getLocalUser();
  }

  Future<User?> _getLocalUser() async {
    return _useCases.getLocalUser().then((result) {
      _user = result;
      notifyListeners();
      return result;
    });
  }

  Future<void> _createLocalUser(User user) async {
    print(user);
  }
}
