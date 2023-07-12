// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holocare/src/blocs/member/member_bloc.dart';
import 'package:holocare/src/blocs/member/member_event.dart';
import 'package:holocare/src/blocs/member/member_state.dart';
import 'package:holocare/src/service/device_service.dart';
import 'package:holocare/src/ui/screen/choice_page.dart';
import 'package:holocare/src/ui/screen/protected/protected_home_page.dart';
import 'package:holocare/src/ui/screen/protected/protected_code_share_page.dart';
import 'package:holocare/src/ui/screen/protector/protector_connect_request_page.dart';
import 'package:holocare/src/ui/screen/protector/protector_main_page.dart';

import '../../models/member.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final FirebaseFirestore memberCollection = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // MemberBloc memberBloc = BlocProvider.of<MemberBloc>(context);
    //
    // // Timer(Duration(seconds: 5), () async {
    //   MemberService()
    //       .getUserDeviceId()
    //       .then((value) => userInfo = value).then((value) => userInfo = value);
    // print(userInfo);
    // memberBloc.add(FindMemberEvent());
    // // });
    Timer(Duration(seconds: 5), () async {
      try {
        var deviceId = "";
        await MemberService()
            .getUserDeviceId()
            .then((value) => deviceId = value);
        print("splash result ==========");
        var a = await memberCollection.collection("member").doc(deviceId).get();

        //비회원
        if (!a.exists) {
          print("empty");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChoicePage(deviceId: deviceId)));
        } else {
          Member m = Member.fromJson(a.data()! as Map<String, dynamic>);
          print(m.toString());
          Loaded(member: m);
          //보호자
          if (m.type == 1) {
            if (m.status == "connected") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProtectorMainPage()));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProtectorConnectRequestPage()));
            }
          } else {
            //보호 대상자
            if (m.status == 'connected') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProtectedMainPage()));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProtectedCodeSharePage( code: m.code,)));
            }
          }
        }
      } catch (e, s) {
        print(s);
      }
    });
  }

  _getUserDeviceId() {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SvgPicture.asset(
                'assets/icons/Holocare_Logo.svg',
                width: 74,
                height: 74,
              ),
            )),
      ),
    );
  }
}
