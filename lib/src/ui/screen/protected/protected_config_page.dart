import 'package:flutter/material.dart';

class ProtectedConfigPage extends StatefulWidget {
  const ProtectedConfigPage({super.key});

  @override
  State<ProtectedConfigPage> createState() => _ProtectedConfigPageState();
}

class _ProtectedConfigPageState extends State<ProtectedConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Row(
        children: [
          Icon(Icons.navigate_before),
          Text(
            "설정",
          )
        ],
      ),
      Text("보호자 등록"),
      Text("보호자에게 코드를 공유해주세요"),
      Text("CCCCCCC"),
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
                  '보호자 1',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    '연결 끊기',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ]),
      ),
      Text(
        '보호자 등록은 최대 2명까지 가능합니다',
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
      ),
      Text(
        '푸시 알림',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        '앱에 접속할 수 있도록 알림을 보냅니다.',
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          '알림 켜기',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        Icon(
          Icons.toggle_off,
          size: 60,
        ),
      ]),
      Text(
        '보호 중지',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        '휴대폰을 사용할 수 없는 상황이거나 보호를 중지하고 싶은 경우 보호 중지를 활성화 할 수 있습니다.',
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w400,
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          '보호 중지 켜기',
          style: TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
          ),
        ),
        Icon(
          Icons.toggle_off,
          size: 60,
        ),
      ]),
      Text("초기화")
    ]));
  }
}
