import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RoleCard extends ConsumerWidget {
  String title;
  String description;

  RoleCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return Container(
      decoration: BoxDecoration(
        color: theme.appColors.grayscale_25,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.h16.bold(),
            ),
            Text(
              description,
              style: theme.textTheme.h16.description(),
            ),
          ],
        ),
      ),
    );
  }
}
