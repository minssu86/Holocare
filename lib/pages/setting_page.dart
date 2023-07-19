import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/protectee/setting.dart';
import 'package:holocare/pages/protector/setting.dart';
import 'package:holocare/pages/widget/appbar.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: ColorStyles.white,
        appBar: const MyAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: provider.role == "protectee"
              ? const ProtecteeSetting()
              : const ProtectorSetting(),
        ));
  }
}
