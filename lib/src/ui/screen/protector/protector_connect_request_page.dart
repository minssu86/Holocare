import 'package:flutter/material.dart';


class ProtectorConnectRequestPage extends StatefulWidget {
  ProtectorConnectRequestPage({
    Key? key,
  }) : super(key: key);


  @override
  State<ProtectorConnectRequestPage> createState() =>
      _ProtectorConnectRequestPageState();
}

class _ProtectorConnectRequestPageState
    extends State<ProtectorConnectRequestPage> {
  final myController = TextEditingController();

  // _MyCustomFormState가 생성될 때 호출
  @override
  void initState() {
    super.initState();
    // myController에 리스너 추가
    myController.addListener(_printLatestValue);
  }

  // myController의 텍스트를 콘솔에 출력하는 메소드
  void _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  // _MyCustomFormState가 제거될 때 호출
  @override
  void dispose() {
    // 텍스트에디팅컨트롤러를 제거하고, 등록된 리스너도 제거된다.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: const Text("코드를 입력해주세요",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  )),
            ),
            TextField(
                controller: myController,
                decoration: const InputDecoration(labelText: 'Code'),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w600,
                )),
            TextButton(
              onPressed: () => {},
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll<Color>(Color(0xfff2f2f2)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                )),
              ),
              child: const Text(
                "코드 확인",
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
  }
}
