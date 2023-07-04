import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holocare/controller/HomeController.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AuthenticationCodeView extends StatefulWidget {
  const AuthenticationCodeView({super.key,});

  @override
  State createState() => _AuthenticationCodeViewState();

}

class _AuthenticationCodeViewState extends StateMVC<AuthenticationCodeView> {
  _AuthenticationCodeViewState() : super(HomeController()) {
    var con = controller as HomeController;
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(
                '보호자에게',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(
                '코드를 공유해주세요',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.only(bottom: 100),
            //   child: Text(
            //     ,
            //     textAlign: TextAlign.left,
            //     style: TextStyle(fontSize: 24),
            //   ),
            // ),
            SizedBox(
              width: screenWidth,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation:0,
                    backgroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthenticationCodeView()),
                    );
                  },
                  child: const Text('복사하기'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}