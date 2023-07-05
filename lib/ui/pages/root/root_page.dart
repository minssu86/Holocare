import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/button/holocare_button.dart';
import 'package:holocare/ui/components/card/role_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RootPage extends HookConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);

    return Scaffold(
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
                            "역할을 선택해주세요",
                            style: TextStyle(
                              color: theme.appColors.grayscale_100,
                              fontSize: theme.textTheme.h24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(24),
                          Text(
                            "역할을 수정할 수 없으니 신중하게 선택해주세요",
                            style: TextStyle(
                              color: theme.appColors.grayscale_50,
                              fontSize: theme.textTheme.b14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 0,
              child: Column(
                children: [
                  const Gap(60),
                  RoleCard(
                    title: "보호자",
                    description: "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다",
                  ),
                  const Gap(12),
                  RoleCard(
                    title: "보호자",
                    description: "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다",
                  ),
                  const Gap(60),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: HolocareButton(
                title: "다음",
              ),
            )
          ],
        ),
      ),
    );
  }
}
