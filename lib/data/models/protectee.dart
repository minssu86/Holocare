import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holocare/data/models/local_user.dart';

class Protectee extends LocalUser {
  String? code;
  Timestamp connectTime;
  List<String> protectorIds;

  Protectee(
    super.uid,
    super.role,
    super.status,
    super.push,
    this.code,
    this.connectTime,
    this.protectorIds,
  );
  factory Protectee.newUser(LocalUser localUser, code) {
    return Protectee(
      localUser.uid,
      "protectee",
      localUser.status,
      localUser.push,
      code,
      Timestamp.now(),
      [],
    );
  }
  factory Protectee.getUser(Map<String, dynamic> data) {
    return Protectee(
      data["uid"],
      data["role"],
      data["status"],
      data["push"],
      data["code"],
      data["connectTime"],
      (data["protectorIds"] as List<dynamic>).map((v) => v.toString()).toList(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map.addAll({
      "code": code,
      "connectTime": connectTime,
      "protectorIds": protectorIds,
    });
    return map;
  }

  @override
  void updateUser(Map<String, dynamic> data) {
    super.updateUser(data);
    code = data["code"];
    connectTime = data["connectTime"];
    protectorIds = (data["protectorIds"] as List<dynamic>)
        .map((v) => v.toString())
        .toList();
  }
}
