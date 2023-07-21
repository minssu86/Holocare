import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingItem extends ConsumerWidget {
  final String title;
  String? description;
  bool? condition;
  SettingItemType type;
  void Function()? onPressed;
  void Function(bool)? onChanged;

  SettingItem({
    super.key,
    required this.type,
    required this.title,
    this.condition,
    this.description,
    this.onPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.b17.title().semiBold(),
            ),
            if (description != null) const Gap(8),
            if (description != null)
              Text(
                description!,
                style: theme.textTheme.c13.description(),
              )
          ],
        ),
        if (type == SettingItemType.arrowBtn)
          IconButton(
            iconSize: 16,
            color: theme.appColors.grayscale_01,
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
            ),
          ),
        if (type == SettingItemType.switchBtn)
          CupertinoSwitch(
            value: condition!,
            onChanged: onChanged,
          ),
      ],
    );
  }
}
