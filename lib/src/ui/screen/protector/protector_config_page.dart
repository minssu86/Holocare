import 'package:flutter/material.dart';

class ProtectorConfigPage extends StatefulWidget {
  const ProtectorConfigPage({super.key});

  @override
  State<ProtectorConfigPage> createState() => _ProtectorConfigPageState();
}

class _ProtectorConfigPageState extends State<ProtectorConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        children: [
          Icon(Icons.navigate_before),
          Text(
            "설정",
          )
        ],
      ),
      Text("연결 끊기"),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [Text("현재 연결 코드"), Text("abababab")],
      ),
      Container(
          child: TextButton(
        onPressed: () => {()},
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0xfff2f2f2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          )),
        ),
        child: Text("연결 끊기"),
      )),
      Text("푸시 알림"),
      Text("보호 대상자가 하루 동안 접속이 없을 시 알람을 보냅니다."),
      Container(
        width: 309,
        height: 41,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: ShapeDecoration(
            color: Color(0xFFF2F2F2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                child: Text(
                  '알림 켜기',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.toggle_off),
                onPressed: () {},
              ),
            ]),
      ),
      Text(
        '초기화',
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
      ),
    ]));
  }
}
