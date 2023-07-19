import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/protectee/main.dart';
import 'package:holocare/pages/protector/main.dart';
import 'package:holocare/pages/setting_page.dart';
import 'package:holocare/pages/widget/appbar.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (provider.role == "protectee" && provider.protectorIds!.isEmpty) {
        Navigator.popUntil(context, (route) {
          print(route.settings);
          return route.settings.name == "/main";
        });
        Navigator.pushReplacementNamed(
          context,
          "/code",
        );
      }

      if (provider.role == "protector" && provider.protecteeId == null) {
        Navigator.pushReplacementNamed(
          context,
          "/code",
        );
      }
    });

    return Scaffold(
        backgroundColor: ColorStyles.white,
        appBar: MyAppBar(
          action: IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingPage()),
            ),
            icon: const Icon(Icons.settings),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: provider.role == "protectee"
              ? const ProtecteeMain()
              : const ProtectorMain(),
        ));
  }
}
