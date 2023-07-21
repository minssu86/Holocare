import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RoleCard extends ConsumerWidget {
  String title;
  String description;
  bool active;
  GestureTapCallback? onTap;

  RoleCard(
      {super.key,
      required this.title,
      required this.description,
      required this.active,
      this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: theme.appColors.white,
          border: Border.all(
            width: 2,
            color:
                active ? theme.appColors.primary : theme.appColors.grayscale_04,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.b17.bold(),
                    ),
                    Text(
                      description,
                      style: theme.textTheme.b14.description(),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 0,
                child: IconButton(
                  iconSize: active ? 20 : 0,
                  color: theme.appColors.primary,
                  icon: const Icon(
                    Icons.check_circle_rounded,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
