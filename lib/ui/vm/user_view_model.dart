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

  UserViewModel(this._reader);

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

  Future<void> verify(int? code) async {
    if (user == null) return;
    final verified = await _useCases.getStorage().then((value) {
      value?.update("verified", (_) => true);
      return value;
    });
    await _useCases.updateStorage(verified!);

    if (code != null) {
      await _useCases.updateUser(user!.uuid, {"verified": true, "code": code});
    } else {
      await _useCases.updateUser(user!.uuid, {"verified": true});
    }

    await syncUser();
  }

  Future<void> updateVisited() async {
    if (user == null) return;
    final now = DateTime.now().toString();
    await _useCases.updateUser(user!.uuid, {"visitedAt": now});
  }

  Future<void> createUser(Role role) async {
    final user = User(
      code: role.role == Role.protege.role ? Utils.generateCode() : null,
      uuid: const Uuid().v4(),
      role: role.role,
      verified: false,
      pause: false,
    );
    await _useCases.createUser(user).then((_) {
      _user = user;
      notifyListeners();
    });
    await _useCases.updateStorage({"uuid": user.uuid, "verified": false});
  }

  Future<void> deleteUser() async {
    if (_user == null) return;
    await _useCases.deleteUser(user!.uuid).then((_) {
      _user = null;
      notifyListeners();
    });
    await _useCases.deleteStorage();
  }

  // @deprecated
  Future<void> getUsersByCode(int code) async {
    await _useCases.queryUser(field: "code", isEqualTo: code).then((value) {
      _members = [...value];
      notifyListeners();
    });
  }

  Future<void> syncUser() async {
    final storage = await _useCases.getStorage();
    if (storage != null && storage.containsKey('uuid')) {
      final uuid = storage['uuid'];
      final value = await _useCases.getUser(uuid);
      _user = value;
      notifyListeners();
    }
  }
}
