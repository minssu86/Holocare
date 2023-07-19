import 'package:flutter/material.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo/logo.png',
          width: 74,
        ),
      ),
    );
  }

  void _init(BuildContext context) async {
    print("init");
    UserProvider provider = context.read<UserProvider>();
    await provider.init();
    // if(provider.role == null){

    // }

    if (!mounted) return;
    String goTO = "/main";

    if (provider.role == null) {
      goTO = "/role";
    } else if (provider.role == "protectee") {
      if (provider.protectorIds!.isEmpty) {
        goTO = "/code";
      }
    } else if (provider.role == "protector") {
      if (provider.protecteeId == null) {
        goTO = "/code";
      }
    }
    Navigator.pushReplacementNamed(context, goTO);
  }
}
