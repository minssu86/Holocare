import 'package:flutter/material.dart';

class ProtectedMainPage extends StatefulWidget {
  const ProtectedMainPage({super.key});

  @override
  State<ProtectedMainPage> createState() => _ProtectedMainPageState();
}

class _ProtectedMainPageState extends State<ProtectedMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "홀로케어",
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 24,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(Icons.settings)
            ],
          ),
          Center(
            child: Column(
              children: [
                Text(
                  '😉',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 40,
                    fontFamily: 'SF Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '오늘의 안전이\n확인 되었습니다!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    // height: 34,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 309,
            height: 73,
            decoration: ShapeDecoration(
              color: Color(0xFFF2F2F2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'AD',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
