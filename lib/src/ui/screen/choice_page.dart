import 'package:holocare/src/ui/widget/choice_button.dart';
import 'package:flutter/material.dart';

import '../widget/main_text.dart';

class ChoicePage extends StatefulWidget {
  ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
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
                  ChoiceButton(
                    title: "보호 대상자 / 피보호자",
                    type: "protected",
                    description: "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다.",
                  ),
                  ChoiceButton(
                    title: "보호자",
                    type: "protector",
                    description: "보호자는 보호 대상자의 활동이 감지되지 않으면 알림을 받습니다.",
                  ),
                ],
              ),
            ),
          ),
          Container(
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
                    onPressed: () => {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xFF8D4BF6)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      )),
                    ),
                    child: Text(
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
