import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holocare/src/models/member.dart';
import 'package:holocare/src/repository/member_repo.dart';
import 'package:holocare/src/ui/screen/protected/protected_code_share_page.dart';
import 'package:holocare/src/ui/screen/protector/protector_connect_request_page.dart';

class ChoicePage extends StatefulWidget {
  ChoicePage({Key? key, required this.deviceId}) : super(key: key);
  final deviceId;

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {

  bool protectedChecked = false;
  bool protectorChecked = false;

  Future<Member> signUp() async {
    print(widget.deviceId.toString().substring(0,6));
    Member member =
    Member(
        deviceId: widget.deviceId,
        code: widget.deviceId.toString().substring(0, 6),
        connectCount: 0,
        createAt: DateTime.now().toString(),
        type: protectedChecked == true ? 0 : 1,
        status: "unconnected"
    );

    // todo : null 핸들링을 어케해야하나?
    await MemberRepository().createMember(member);
    return member;
  }

  void protectedCheckedFunction() {
    protectedChecked = true;
    protectorChecked = false;
  }

  void protectorCheckedFunction() {
    protectorChecked = true;
    protectedChecked = false;
  }

  void signUpAndRoute() async {
    print('route');
    if (protectedChecked) {
      Member? result;
      await signUp().then((value) => result = value);
      print(result!.code);

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProtectedCodeSharePage(code: result!.code,)));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProtectorConnectRequestPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            width: 360,
            height: 56,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 40, right: 20),
              child: Column(
                children: [
                  const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "역할을 선택해주세요",
                        style: TextStyle(
                          color: Color(0xFF171717),
                          fontSize: 22,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "역할을 수정할 수 없으니 신중하게 선택해주세요.",
                      style: TextStyle(
                        color: Color(0xFF8B8B8B),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: 320,
                          height: 110,
                          child: TextButton(
                            onPressed: () =>
                            {setState(() => protectedCheckedFunction())},
                            style: ButtonStyle(
                              backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color(0xffffffff)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFF8D4BF6)),
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              // margin: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "보호 대상자 / 피보호자",
                                          style: TextStyle(
                                            color: Color(0xFF171717),
                                            fontSize: 17,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다.",
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            overflow: TextOverflow.clip,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, right: 20),
                                    width: 20,
                                    child: Visibility(
                                      visible: protectedChecked,
                                      child: SvgPicture.asset(
                                        'assets/icons/ic_round-check-circle.svg',
                                        width: 74,
                                        height: 74,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          width: 320,
                          height: 110,
                          child: TextButton(
                            onPressed: () =>
                            {setState(() => protectorCheckedFunction())},
                            style: ButtonStyle(
                              backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Color(0xffffffff)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 1, color: Color(0xFF8D4BF6)),
                                    borderRadius: BorderRadius.circular(8.0),
                                  )),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              // margin: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
                              child: Row(
                                children: [
                                  const Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "보호자",
                                          style: TextStyle(
                                            color: Color(0xFF171717),
                                            fontSize: 17,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "보호자는 보호 대상자의 활동이 감지되지 않으면 알림을 받습니다.",
                                          style: TextStyle(
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14,
                                            overflow: TextOverflow.clip,
                                            fontFamily: 'Pretendard',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 8, right: 20),
                                    width: 20,
                                    child: Visibility(
                                      visible: protectorChecked,
                                      child: SvgPicture.asset(
                                        'assets/icons/ic_round-check-circle.svg',
                                        width: 74,
                                        height: 74,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 360,
            height: 84,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 320,
                  height: 52,
                  child: TextButton(
                    onPressed: () => {signUpAndRoute()},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Color(0xFF8D4BF6)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                    ),
                    child: const Text(
                      "다음",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 17,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
