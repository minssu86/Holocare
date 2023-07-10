import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HolocareAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final void Function()? onPressed;

  HolocareAppBar({super.key, this.onPressed});

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return AppBar(
      elevation: 0,
      backgroundColor: theme.appColors.grayscale_00,
      leading: IconButton(
        iconSize: 24,
        color: theme.appColors.grayscale_100,
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
