import 'package:flutter/material.dart';
import 'package:holocare/controller/HomeController.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State createState() => _HomeViewState();
}

class _HomeViewState extends StateMVC<HomeView> {
  _HomeViewState() : super(HomeController()) {
    con = controller as HomeController;
  }

  late HomeController con;

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
                '역할을 선택해주세요',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation:0,
                    backgroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () {},
                  child: const Text('보호 대상자?'),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation:0,
                      backgroundColor: const Color.fromRGBO(242, 242, 242, 1.0),
                      foregroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text('보호자'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
