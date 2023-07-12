import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashBoardAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  void Function()? onPressedSetting;

  DashBoardAppBar({super.key, this.onPressedSetting});

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return AppBar(
      elevation: 0,
      backgroundColor: theme.appColors.white,
      leading: IconButton(
        iconSize: 24,
        color: theme.appColors.grayscale_01,
        icon: const Icon(Icons.logo_dev_rounded),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          iconSize: 24,
          color: theme.appColors.grayscale_01,
          icon: const Icon(Icons.settings_rounded),
          onPressed: onPressedSetting,
        ),
      ],
    );
  }
}
