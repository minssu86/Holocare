import 'package:holocare/data/models/local_user.dart';

class Protector extends LocalUser {
  String? protecteeId;
  String? connectCode;

  Protector(
    super.uid,
    super.role,
    super.status,
    super.push,
    this.protecteeId,
    this.connectCode,
  );
  factory Protector.newUser(LocalUser localUser) {
    return Protector(
      localUser.uid,
      "protector",
      localUser.status,
      localUser.push,
      null,
      null,
    );
  }
  factory Protector.getUser(Map<String, dynamic> data) {
    return Protector(
      data["uid"],
      data["role"],
      data["status"],
      data["push"],
      data["protecteeId"],
      data["connectCode"],
    );
  }
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = super.toJson();
    map.addAll({
      "protecteeId": protecteeId,
    });
    return map;
  }

  @override
  void updateUser(Map<String, dynamic> data) {
    super.updateUser(data);
    protecteeId = data["protecteeId"];
    connectCode = data["connectCode"];
  }
}
