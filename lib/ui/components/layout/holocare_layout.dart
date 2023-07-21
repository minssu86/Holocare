import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/ui/components/appbar/holocare_app_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HolocareLayout extends HookConsumerWidget {
  Widget title;
  Widget? description;
  Widget? label;
  List<Widget>? widgets;
  final void Function()? onPressedAppbar;
  bool? leading;
  bool? actions;

  HolocareLayout({
    super.key,
    required this.title,
    this.description,
    this.label,
    this.widgets,
    this.onPressedAppbar,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();

    return Scaffold(
      appBar: HolocareAppBar(
        onPressedAppbar: onPressedAppbar,
        leading: leading,
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      if (description != null) const Gap(16),
                      if (description != null) description!,
                    ],
                  ),
                  if (label != null) label!,
                ],
              ),
            ),
            if (widgets != null && widgets!.isNotEmpty) ...widgets!,
          ],
        ),
      ),
    );
  }
}
