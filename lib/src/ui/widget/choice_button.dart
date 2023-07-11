// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChoiceButton extends StatefulWidget {
  ChoiceButton({
    Key? key,
    this.title,
    this.deviceId,
    this.description,
    this.type,
    // required this.function,
  }) : super(key: key);
  final title;
  final deviceId;
  final description;
  final type;

  // final Widget function;

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("member");

  // final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  // final String code;

  @override
  void initState() {
    super.initState();
    print("choice init");
  }

  void signUp() async {
    // collectionReference.doc(widget.deviceId).set(loginInfo.toJson());
    // loginProvider.setLoginInfo(loginInfo);
    // print("login info ${loginInfo.getMyId()}");
    // print("login provider${loginProvider.getMyId()}");
    // Navigator.push(context, MaterialPageRoute(builder: (_) => widget.function));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Container(
          margin: EdgeInsets.only(bottom: 16),
          width: 320,
          height: 110,
          child: TextButton(
            onPressed: () => {signUp()},
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0xffffffff)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF8D4BF6)),
                borderRadius: BorderRadius.circular(8.0),
              )),
            ),
            child: SizedBox(
              width: double.infinity,
              // margin: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
              child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Color(0xFF171717),
                              fontSize: 17,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            widget.description,
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
                      margin: EdgeInsets.only(left: 8),
                      width: 20,
                    )
                  ],
                ),),
              ),
            ),
          ),
      ],
    );
  }
}
