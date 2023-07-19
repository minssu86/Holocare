import 'package:flutter/material.dart';
import 'package:holocare/config/theme.dart';
import 'package:holocare/pages/protectee/code_page.dart';
import 'package:holocare/pages/protector/code_page.dart';
import 'package:holocare/pages/widget/appbar.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
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
              ? const ProtecteeCodePage()
              : const ProtectorCodePage(),
        ));
  }
}
