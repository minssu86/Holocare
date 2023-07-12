import 'package:cloud_firestore/cloud_firestore.dart';

class UserEntity {
  final String uid;
  String? code;
  String? role;
  Timestamp? connectTime;
  List<dynamic>? protectors;
  String? protectee;
  bool push = true;
  bool state = true;

  UserEntity(this.uid, this.code, this.role, this.connectTime, this.protectors,
      this.protectee, this.push, this.state);
}
