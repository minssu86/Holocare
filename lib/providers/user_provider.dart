import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holocare/config/custom_exception.dart';
import 'package:holocare/data/models/local_user.dart';
import 'package:holocare/data/models/protectee.dart';
import 'package:holocare/data/models/protector.dart';
import 'package:holocare/data/repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuth auth;
  final FirebaseFirestore db;
  final UserRepository repository;
  late LocalUser localUser;
  String? get role => localUser.role;
  String? get code {
    if (localUser is Protectee) {
      return (localUser as Protectee).code;
    } else {
      return (localUser as Protector).connectCode;
    }
  }

  List<String>? get protectorIds => (localUser as Protectee).protectorIds;
  String? get protecteeId => (localUser as Protector).protecteeId;
  bool get status => localUser.status;
  UserProvider({
    required this.auth,
    required this.db,
    required this.repository,
  });
  Future<void> init() async {
    Map<String, dynamic> data = await repository.getUser();
    if (data['role'] == null) {
      localUser = LocalUser.getUser(data);
    } else if (data['role'] == "protectee") {
      localUser = Protectee.getUser(data);
    } else if (data['role'] == "protector") {
      localUser = Protector.getUser(data);
    }
    repository.getUserSnapshot(localUser.uid).listen((event) async {
      if (event.data() != null) {
        localUser.updateUser(event.data()!);
        print(localUser.toJson());
      }
      notifyListeners();
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getProtecteeSnapshot() {
    return repository.getUserSnapshot(protecteeId);
  }

  Future<void> setRole(role) async {
    if (role == "protectee") {
      String code = await generateCode();
      localUser = Protectee.newUser(localUser, code);
    } else if (role == "protector") {
      localUser = Protector.newUser(localUser);
    }
    await repository.updateUser(localUser.toJson());
  }

  Future<void> reset() async {
    if (role == "protectee") {
      protectorIds!.map(
        (protectorId) async => await disconnect(localUser.uid, protectorId),
      );
    } else if (role == "protector") {
      await disconnect(protecteeId, localUser.uid);
    }
    await repository.deleteUser();
    await auth.currentUser?.delete();
    await auth.signOut();
    print(auth.currentUser);
    await init();
  }

  Future<void> updatePush(push) async {
    localUser.push = push;
    await repository.updateUser(localUser.toJson());
  }

  Future<void> updateStatus(status) async {
    localUser.status = status;
    await repository.updateUser(localUser.toJson());
  }

  Future<void> setConnectTime() async {}
  Future<String> generateCode() async {
    String code = Random().nextInt(1000000).toString().padLeft(6, '0');
    while (await repository.existsCode(code)) {
      code = Random().nextInt(1000000).toString().padLeft(6, '0');
    }
    return code;
  }

  Future<void> connectCode(code) async {
    try {
      await repository.connectCode(code, localUser);
    } on CustomException {
      rethrow;
    }
  }

  Future<void> disconnect(protecteeId, protectorId) async {
    if (localUser is Protectee) {
      (localUser as Protectee).protectorIds.remove(protectorId);
      await repository.updateUser(localUser.toJson());
      await repository.updateUser(
          {"uid": protectorId, "protecteeId": null, "connectCode": null});
    } else if (localUser is Protector) {
      (localUser as Protector).protecteeId = null;
      (localUser as Protector).connectCode = null;
      await repository.updateUser(localUser.toJson());
      Protectee protectee =
          Protectee.getUser(await repository.getUserById(protecteeId));
      protectee.protectorIds.remove(protectorId);
      await repository.updateUser(protectee.toJson());
    }
  }
}
