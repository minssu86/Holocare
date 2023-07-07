import 'package:flutter/foundation.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/use_case/use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userViewModelProvider =
    ChangeNotifierProvider((ref) => UserViewModel(ref.read));

class UserViewModel extends ChangeNotifier {
  final dynamic _reader;

  UserViewModel(this._reader);

  late final UseCases _useCases = _reader(useCasesProvider);

  User? _user;

  User? get user => _user;

  bool get isVerified => _user != null;

  Future<User?> getUser() async {
    return _useCases.getUser().then((result) {
      _user = result;
      notifyListeners();
      return result;
    });
  }

  Future<void> _createUser(User user) async {
    print(user);
  }
}
