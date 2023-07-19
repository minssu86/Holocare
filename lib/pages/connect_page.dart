import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/protectee/connect.dart';
import 'package:holocare/pages/protector/connect.dart';
import 'package:holocare/pages/widget/appbar.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ConnectPage extends StatelessWidget {
  const ConnectPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: ColorStyles.white,
        appBar: MyAppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: provider.role == "protectee"
              ? const ProtecteeConnect()
              : const ProtectorConnect(),
        ));
  }
}
