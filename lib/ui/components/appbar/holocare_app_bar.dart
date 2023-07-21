import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HolocareAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  final void Function()? onPressedAppbar;
  bool? leading;
  bool? actions;

  HolocareAppBar({
    super.key,
    this.onPressedAppbar,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    if (leading != null && leading!) {
      return AppBar(
        elevation: 0,
        backgroundColor: theme.appColors.white,
        leading: IconButton(
          iconSize: 24,
          color: theme.appColors.grayscale_01,
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          onPressed: onPressedAppbar,
        ),
      );
    } else if (actions != null && actions!) {
      return AppBar(
        elevation: 0,
        backgroundColor: theme.appColors.white,
        actions: [
          IconButton(
            iconSize: 24,
            color: theme.appColors.grayscale_01,
            icon: const Icon(Icons.settings_rounded),
            onPressed: onPressedAppbar,
          ),
        ],
      );
    } else {
      return AppBar(
        elevation: 0,
        backgroundColor: theme.appColors.white,
      );
    }
  }
}
