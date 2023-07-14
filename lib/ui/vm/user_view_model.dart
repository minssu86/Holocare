import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
  List<User> _members = [];
  User? get user => _user;

  List<User> get members => _members;

  bool get isVerified => _user != null;

  bool get isExistProtectorMember =>
      _members.where((member) => member.role == Role.protector.role).isNotEmpty;

  bool get isExistProtegeMember =>
      _members.where((member) => member.role == Role.protege.role).isNotEmpty;

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? memberstream(
      int? code) {
    if (code == null) return null;
    return _useCases.memberstream(code).listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        _members = snapshot.docs.map((e) => User.fromJson(e.data())).toList();
        notifyListeners();
      }
    });
  }

  Future<void> updateRole(Role role) async {
    await _updateLocalUser(
      User(
        role: role.role,
        uuid: const Uuid().v4(),
        verified: false,
        pause: false,
        code: Role.protege.role == role.role ? Utils.generateCode() : null,
      ),
    );
  }

  Future<void> updateCode(int code) async {
    if (user == null) return;
    await _useCases.updateUser(user!.uuid, {"code": code});
    await _updateLocalUser(
      User(
        role: user!.role,
        uuid: user!.uuid,
        verified: true,
        pause: false,
        code: code,
      ),
    );
  }

  Future<void> updateVisited() async {
    if (user == null) return;
    final now = DateTime.now().toString();
    await _useCases.updateUser(user!.uuid, {"visitedAt": now});
    await getUsersByCode(user!.code!);
  }

  Future<void> createUser() async {
    if (user == null) return;
    await _useCases.createUser(user!);
  }

  Future<void> deleteUser() async {
    if (_user == null) return;
    await _useCases.deleteUser(user!.uuid).then((_) {
      _user = null;
      notifyListeners();
    });
  }

  Future<void> getUsersByCode(int code) async {
    await _useCases.queryUser(field: "code", isEqualTo: code).then((value) {
      _members = [...value];
      notifyListeners();
    });
  }

  Future<User?> _getLocalUser() async {
    return _useCases.getLocalUser().then((result) {
      _user = result;
      notifyListeners();
      return result;
    });
  }

  Future<void> _updateLocalUser(User user) async {
    await _useCases.createLocalUser(user);
    await _getLocalUser();
  }
}