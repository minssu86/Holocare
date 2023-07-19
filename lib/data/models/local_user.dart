class LocalUser {
  final String uid;
  String? role;
  bool status;
  bool push;

  LocalUser(this.uid, this.role, this.status, this.push);

  factory LocalUser.newUser(String uid) {
    return LocalUser(
      uid,
      null,
      true,
      true,
    );
  }
  factory LocalUser.getUser(Map<String, dynamic>? data) {
    if (data == null) {
      throw Exception();
    }
    return LocalUser(
      data['uid'],
      data['role'],
      data['status'],
      data['push'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "role": role,
      "status": status,
      "push": push,
    };
  }

  void updateUser(Map<String, dynamic> data) {
    role = data["role"];
    status = data["status"];
    push = data["push"];
  }
}
