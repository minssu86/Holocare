import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:holocare/data/models/user_model.dart';
import 'package:holocare/data/repositories/user_repository.dart';

import '../config/custom_exception.dart';

class UserProvider extends ChangeNotifier {
  UserModel? userModel;
  UserRepository repository = UserRepository();
  UserProvider();

  String get uid => userModel!.uid;
  String? get role => userModel?.role;
  String? get code => userModel?.code;
  Timestamp? get connectTime => userModel?.connectTime;
  List<dynamic>? get protectors => userModel?.protectors;
  String? get protectee => userModel?.protectee;
  bool? get push => userModel?.push;
  bool? get state => userModel?.state;

  Future<void> init() async {
    userModel = await repository.getUser();

    repository.getUserSnapshot(uid).listen((event) async {
      if (event.data() == null) {
        userModel = await repository.getUser();
      } else {
        userModel?.updateFromJson(event.data());
      }

      print("dataChange!!!!");
      print(userModel!.toMap());
      notifyListeners();
    });
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserSnapshot() {
    return repository.getUserSnapshot(uid);
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getProtecteeSnapshot() {
    return repository.getUserSnapshot(protectee);
  }

  Future<String?> _generateCode() async {
    String code = Random().nextInt(1000000).toString().padLeft(6, '0');
    if (await repository.existsCode(code)) {
      return null;
    }
    return code;
  }

  Future<void> setRole(String role) async {
    String? code;
    if (role == "protectee") {
      code = await _generateCode();
    }
    await repository.update(userModel!.uid, {
      "role": role,
      "code": code,
    });
    userModel!.role = role;
    userModel!.code = code;
    notifyListeners();
  }

  Future<void> updateConnectTime() async {
    await repository.update(uid, {
      "connectTime": Timestamp.fromDate(DateTime.now()),
    });
  }

  // Future<void> update(String key, dynamic value) async {
  //   await repository.update(userModel!.id, key, value);
  // }

  // dynamic getProtectee() {
  //   return userModel!.protectee;
  // }

  Future<void> connectCode(code) async {
    try {
      print(code);
      await repository.connectCode(code, uid);
    } on CustomException {
      rethrow;
    }
  }

  Future<void> reset() async {
    await repository.reset(uid);
  }

  Future<void> updatePush(push) async {
    await repository.update(uid, {"push": push});
  }

  Future<void> updateState(state) async {
    await repository.update(uid, {"state": state});
  }

  disconnect(String protecteeUid, String protectorUid) async {
    await repository.disconnect(protecteeUid, protectorUid);
  }
}
