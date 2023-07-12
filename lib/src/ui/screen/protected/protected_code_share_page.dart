// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holocare/src/blocs/member/member_bloc.dart';
import 'package:holocare/src/blocs/member/member_state.dart';
import 'package:provider/provider.dart';

class ProtectedCodeSharePage extends StatefulWidget {
  ProtectedCodeSharePage({
    Key? key,
    required this.code,
  }) : super(key: key);
  final code;

  @override
  State<ProtectedCodeSharePage> createState() => _ProtectedCodeSharePageState();
}

class _ProtectedCodeSharePageState extends State<ProtectedCodeSharePage> {
  late CollectionReference itemsReference;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberBloc, MemberState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SizedBox(
              width: 360,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: 360,
                    height: 56,
                    margin: EdgeInsets.only(top: 8, left: 4, right: 4),
                    child: SvgPicture.asset(
                      'assets/icons/arrow_back_24px.svg',
                      width: 48,
                      height: 48,
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
                          child: Text(
                            "보호자에게 코드를\n"
                            "공유해주세요.",
                            style: TextStyle(
                              color: Color(0xff171717),
                              fontSize: 22,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 16, left: 20, right: 20),
                          child: Text(
                            "보호자가 코드를 입력하면 연결이 완료돼요.",
                            style: TextStyle(
                              color: Color(0xFF8B8B8B),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 60),
                          width: 320,
                          height: 58,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 0.5, color: Color(0xFFDFDFDF)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(widget.code.toString().toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 360,
                      height: 84,
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 52,
                            decoration: ShapeDecoration(
                              color: Color(0xFF8D4BF6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            child: TextButton(
                              onPressed: () => {(
                                copyToCode(context, widget.code)
                              )},
                              child: Text(
                                '복사하기',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void copyToCode(BuildContext context, deviceId) {
  Clipboard.setData(ClipboardData(text: deviceId));
  showDialog(
      context: context,
      //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          //Dialog Main Title
          title: Column(
            children: <Widget>[
              Text("연결에 성공하였습니다."),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "보호자가 코드를 입력하여\n연결되었습니다.",
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
