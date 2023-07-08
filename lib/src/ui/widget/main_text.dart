import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return
        Container(
          alignment: Alignment.centerLeft,
          child: Text("역할을 선택해주세요",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w600,
          )),
          );
        // );
  }
}
