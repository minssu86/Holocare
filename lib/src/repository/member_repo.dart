import '../models/member.dart';

class MemberRepository {
  Future<Member> findMember() async {
    return Member(
        deviceId: "a", code: "b", type: 1, createAt: DateTime.now().toString(), connectCount: 0, status: "unconnected");
  }

  Future<Member> createMember(Member member) async {
    return Member(
        deviceId: member.deviceId,
        code: member.code,
        type: member.type,
        createAt: DateTime.now().toString(), connectCount: 0, status: 'unconnected');
  }

  Future<Member> updateMember(Member member) async {
    return Member(
        deviceId: member.deviceId,
        code: member.code,
        type: 1,
        createAt: DateTime.now().toString(), connectCount: 1, status: "connected");
  }
}
