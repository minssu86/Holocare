import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/appbar/holocare_app_bar.dart';
import 'package:holocare/ui/components/button/holocare_button.dart';
import 'package:holocare/ui/components/text_field/holocare_pin_code_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RootProtectorPage extends HookConsumerWidget {
  const RootProtectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return Scaffold(
      appBar: HolocareAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "코드를 입력해주세요",
                            style: theme.textTheme.h24.bold().title(),
                          ),
                          const Gap(24),
                          Text(
                            "보호 대상자에게서 공유 받은 코드를 입력해주세요",
                            style: theme.textTheme.b14.description(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Flexible(
              flex: 0,
              child: Column(
                children: [
                  Gap(60),
                  HolocarePinCodeField(),
                  Gap(60),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: HolocareButton(
                title: "연결하기",
              ),
            )
          ],
        ),
      ),
    );
  }
}
