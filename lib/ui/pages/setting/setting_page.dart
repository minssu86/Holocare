import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/appbar/holocare_app_bar.dart';
import 'package:holocare/ui/components/item/setting_item.dart';
import 'package:holocare/ui/router/router.gr.dart';
import 'package:holocare/ui/vm/dashboard_view_model.dart';
import 'package:holocare/ui/vm/setting_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final theme = ref.watch(holocareThemeProvider);
    final dashboardViewModel = ref.watch(dashboardViewModelProvider);
    final settingViewModel = ref.watch(settingViewModelProvider);

    return Scaffold(
      appBar: HolocareAppBar(
        onPressed: () => router.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: Row(
                children: [
                  Text(
                    "설정",
                    style: theme.textTheme.h28.title().bold(),
                  ),
                ],
              ),
            ),
            const Gap(28),
            Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SettingItem(
                      title: "보호자 등록",
                      type: SettingItemType.arrowBtn,
                      onPressed: () => router.push(const SettingEditRoute()),
                    ),
                    const Gap(40),
                    SettingItem(
                      title: "푸시 알림",
                      description: "앱에 접속할 수 있도록 알림을 보냅니다.",
                      condition: settingViewModel.pause,
                      type: SettingItemType.switchBtn,
                    ),
                    const Gap(40),
                    SettingItem(
                      title: "보호 중지",
                      description: "보호 중지를 켜면 보호자에게 알림이 가지 않습니다.",
                      type: SettingItemType.switchBtn,
                      condition: settingViewModel.pause,
                      onChanged: (condition) {
                        settingViewModel.updatePause(condition);
                      },
                    ),
                    const Gap(40),
                    SettingItem(
                      title: "초기화",
                      type: SettingItemType.arrowBtn,
                      onPressed: () => router.push(const SettingResetRoute()),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
