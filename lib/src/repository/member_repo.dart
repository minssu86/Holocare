import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/member.dart';

class MemberRepository {
  final FirebaseFirestore memberCollection = FirebaseFirestore.instance;

  Future<Member> findMember() async {
    return Member(
        deviceId: "a",
        code: "b",
        type: 1,
        createAt: DateTime.now().toString(),
        connectCount: 0,
        status: "unconnected");
  }

  Future<Member?> createMember(Member member) async => await memberCollection
          .collection("member")
          .doc(member.deviceId)
          .set(member.toJson())
          .then((value) {
        return member;
      }).onError((error, stackTrace) => throw Future.error(error.toString()));

  Future<Member> updateMember(Member member) async {
    return Member(
        deviceId: member.deviceId,
        code: member.code,
        type: 1,
        createAt: DateTime.now().toString(),
        connectCount: 1,
        status: "connected");
  }
}
