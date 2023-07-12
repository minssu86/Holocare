import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holocare/src/repository/member_repo.dart';
import 'package:holocare/src/ui/screen/protector/protector_main_page.dart';


class ProtectorConnectRequestPage extends StatefulWidget {
  const ProtectorConnectRequestPage({
    Key? key,
    this.deviceId,
  }) : super(key: key);
  final deviceId;

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

  void connectRequest(String text) async {
    bool result = await MemberRepository().connectRequest(text, widget.deviceId);
    if (result){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProtectorMainPage()));
    } else{
      print("에러");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 360,
          height: MediaQuery
              .of(context)
              .size
              .height,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                width: 360,
                height: 56,
                margin: const EdgeInsets.only(top: 8, left: 4, right: 4),
                child: SvgPicture.asset(
                  'assets/icons/arrow_back_24px.svg',
                  width: 48,
                  height: 48,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: const Text("코드를 입력해주세요",
                        style: TextStyle(
                          color: Color(0xFF171717),
                          fontSize: 22,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 16, left: 20, right: 20),
                    child: const Text("보호 대상자에게서 공유 받은 코드를 입력해주세요",
                        style: TextStyle(
                          color: Color(0xFF8B8B8B),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
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
                ],
              ),
              Expanded(
                child: Container(
                  width: 360,
                  height: 84,
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 52,
                        decoration: ShapeDecoration(
                          color: const Color(0xFF8D4BF6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: TextButton(
                          onPressed: () =>
                          {(
                              connectRequest(myController.text)
                          )},
                          child: const Text(
                            '연결하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
