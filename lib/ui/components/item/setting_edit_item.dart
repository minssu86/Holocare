import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingEditItem extends ConsumerWidget {
  String title;
  int order;
  String? createAt;
  void Function()? onTap;

  SettingEditItem({
    super.key,
    required this.title,
    required this.order,
    this.createAt,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.b14.title().semiBold(),
                  ),
                  const Gap(4),
                  Text(
                    "23.07.02 연결",
                    style: theme.textTheme.c13.description(),
                  )
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: Text(
                  "연결 끊기",
                  style: theme.textTheme.b14.title(),
                ),
              )
            ],
          ),
          if (order.isEven)
            Divider(
              height: 1,
              color: theme.appColors.grayscale_04,
            )
        ],
      ),
    );
  }
}
