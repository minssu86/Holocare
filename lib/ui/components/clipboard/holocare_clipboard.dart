import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HolocareClipboard extends ConsumerWidget {
  int? code;

  HolocareClipboard({
    super.key,
    this.code,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.appColors.grayscale_04),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "연결코드",
                  style: theme.textTheme.c13.description(),
                ),
                const Gap(4),
                Text(
                  "$code",
                  style: theme.textTheme.b17.title().semiBold(),
                ),
              ],
            ),
            GestureDetector(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: '$code'));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.appColors.primarySecondary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Icon(
                        Icons.copy_outlined,
                        color: theme.appColors.primary,
                        size: 16,
                      ),
                      const Gap(4),
                      Text(
                        "복사하기",
                        style: theme.textTheme.b14.semiBold().primary(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
