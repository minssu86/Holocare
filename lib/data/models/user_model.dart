import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holocare/data/entity/user.dart';

class UserModel extends UserEntity {
  UserModel(String uid, String? code, String? role, Timestamp connectTime,
      List<dynamic>? protectors, String? protectee, bool push, bool state)
      : super(uid, code, role, connectTime, protectors, protectee, push, state);
  factory UserModel.fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      throw Error();
    }
    return UserModel(map['uid'], map['code'], map['role'], map['connectTime'],
        map['protectors'], map['protectee'], map['push'], map['state']);
  }

  void updateFromJson(Map<String, dynamic>? map) {
    if (map == null) {
      throw Error();
    }
    super.role = map['role'];
    super.code = map['code'];
    super.connectTime = map['connectTime'];
    super.protectors = map['protectors'];
    super.protectee = map['protectee'];
    super.push = map['push'];
    super.state = map['state'];
  }

  Map<String, dynamic> toMap() {
    return {
      "role": role,
      "code": code,
      "connectTime": connectTime,
      "protectors": protectors,
      "protectee": protectee,
      "push": push,
      "state": state
    };
  }
}
