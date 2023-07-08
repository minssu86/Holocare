// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChoiceButton extends StatefulWidget {
  ChoiceButton({
    Key? key,
    this.title,
    this.deviceId,
    this.type,
    // required this.function,
  }) : super(key: key);
  final title;
  final deviceId;
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
            margin: EdgeInsets.all(7),
            width: 309,
            height: 73,
            child: TextButton(
              onPressed: () => {signUp()},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xfff2f2f2)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )),
              ),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
