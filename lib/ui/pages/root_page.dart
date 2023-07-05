import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:holocare/ui/components/button/holocare_button.dart';

@RoutePage()
class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HolocareButton(
              title: "버튼",
            ),
          ],
        ),
      ),
    );
  }
}
