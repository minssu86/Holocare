import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title;
  final Widget? action;
  final Widget? leading;
  const MyAppBar({super.key, this.title, this.action, this.leading});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: Colors.white,
      title: title,
      elevation: 0,
      actions: action != null ? [action!] : null,
    );
  }
}
