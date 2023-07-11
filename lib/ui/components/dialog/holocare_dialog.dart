import 'package:flutter/material.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/button/holocare_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HolocareDialog extends ConsumerWidget {
  String title;
  String content;
  String button;
  void Function()? action;

  HolocareDialog({
    super.key,
    required this.title,
    required this.content,
    required this.button,
    this.action,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.only(top: 12),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: theme.textTheme.b17.title().bold(),
          ),
        ],
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content,
            style: theme.textTheme.b14.description(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        HolocareButton(
          title: button,
          onTap: action,
        ),
      ],
    );
  }
}
