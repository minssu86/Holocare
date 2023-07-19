import 'package:flutter/material.dart';
import 'package:holocare/providers/user_provider.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final Widget? action;
  final Widget? leading;
  const MyAppBar({super.key, this.title, this.action, this.leading});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return AppBar(
      leading: leading,
      backgroundColor: Colors.white,
      title: TextButton(
        child: const Text("테스트"),
        onPressed: () async {
          await provider.reset();
          Navigator.pushReplacementNamed(
            context,
            "/",
          );
        },
      ),
      elevation: 0,
      actions: action != null ? [action!] : null,
    );
  }
}
