import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:holocare/src/models/protect.dart';

import '../models/member.dart';

class MemberRepository {
  final FirebaseFirestore firebaseCollection = FirebaseFirestore.instance;

  Future<Member> findMember() async {
    return Member(
        deviceId: "a",
        code: "b",
        type: 1,
        createAt: DateTime.now().toString(),
        connectCount: 0,
        status: "unconnected");
  }

  Future<Member?> createMember(Member member) async => await firebaseCollection
          .collection("member")
          .doc(member.code)
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

  Future<bool> connectRequest(String text, String deviceId) async {
    var targetUser = await firebaseCollection.collection("member").doc(text).get();
    if(targetUser.exists){
      Member target = Member.fromJson(targetUser.data() as Map<String, dynamic>);
      Protect p = Protect(protectedDeviceId: target.deviceId,
          protectorDeviceId: deviceId, code: text, createAt: DateTime.now().toString());
      int targetConnectCount =0;
      if(target.connectCount == 0){
        targetConnectCount = 1;
      } else if (targetConnectCount == 1){
        targetConnectCount = 2;
      } else {
        // todo 모달 띄우는 방법 찾아서 띄울 것, copyWith로 가능 할 것 같다 찾아보고 리팩토링 할 것
      }
      Member targetStatusChange = Member(
        deviceId: target.deviceId,
        code: target.code,
        connectCount: targetConnectCount,
        createAt: target.createAt,
        status: "connected",
        type: target.type
      );

      // 보호 대상자의 stats, connect count 변경
      await firebaseCollection.collection("member").doc(target.code).set(targetStatusChange.toJson());

      // 보호 대상자 - 보호자 docs(protect) 생성
      await firebaseCollection.collection("protect").doc(target.code).set(p.toJson());

      Member currentMember = Member(deviceId: deviceId,
          code: deviceId.substring(0,6),
          type: 1,
          createAt: DateTime.now().toString(),
          connectCount: 1, status: "connected"
      );
      // 보호자 회원가입처리
      await firebaseCollection.collection("member").doc(currentMember.code).set(currentMember.toJson());
      return true;
    }else{
      return false;
    }
  }
}
