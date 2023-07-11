// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holocare/src/blocs/member/member_bloc.dart';
import 'package:holocare/src/blocs/member/member_state.dart';
import 'package:provider/provider.dart';


class ProtectedCodeSharePage extends StatefulWidget {
  ProtectedCodeSharePage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProtectedCodeSharePage> createState() => _ProtectedCodeSharePageState();
}

class _ProtectedCodeSharePageState extends State<ProtectedCodeSharePage> {
  late CollectionReference itemsReference;

  // ItemProvider({reference}) async {
  //   itemsReference = reference ?? FirebaseFirestore.instance.collection('test');
  //   var result = await itemsReference.doc("u3zgYktRRZFs2QW3xRdJ").get();
  //   print(result);
  //   print("aaaaaasdfjkalsdf");
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemberBloc, MemberState>(
      builder: (context, state) {
        return
        Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("코드를 공유해주세요",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Text(state.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    )),
                TextButton(
                  onPressed: () => {copyToCode(context, "bbbbbbb")},
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xfff2f2f2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  child: Text(
                    "복사하기",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
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
              Text("복사되었습니다."),
            ],
          ),
          //
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "보호자에게 전달해주세요!",
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
