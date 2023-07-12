import 'package:flutter/material.dart';
import 'package:holocare/pages/protectee/code.dart';
import 'package:holocare/pages/protectee/home.dart';
import 'package:holocare/pages/protector/home.dart';
import 'package:holocare/pages/select_role_screen.dart';
import 'package:holocare/provider/user_provider.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatelessWidget {
  // String? role;
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    print(provider.role);
    switch (provider.role) {
      case null:
        return const SelectRoleScreen();
      case 'protector':
        return ProtectorHomeScreen(protecteeUid: provider.protectee!);
      case 'protectee':
        if (provider.protectors!.isNotEmpty) {
          return const ProtecteeHomeScreen();
        } else {
          return const ProtecteeCodeScreen();
        }
    }
    return const Text("error");
  }
}
