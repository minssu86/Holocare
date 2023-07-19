import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/appbar/holocare_app_bar.dart';
import 'package:holocare/ui/components/dialog/holocare_dialog.dart';
import 'package:holocare/ui/components/item/setting_item.dart';
import 'package:holocare/ui/router/router.gr.dart';
import 'package:holocare/ui/vm/setting_view_model.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final theme = ref.watch(holocareThemeProvider);
    final userViewModel = ref.watch(userViewModelProvider);
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
                      title: userViewModel.user?.role == Role.protege.role
                          ? "보호자 등록"
                          : "보호자 연결",
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
                      onChanged: (condition) async {
                        await settingViewModel.updatePause(
                            condition: condition,
                            uuid: userViewModel.user?.uuid);
                      },
                    ),
                    const Gap(40),
                    SettingItem(
                      title: "초기화",
                      type: SettingItemType.arrowBtn,
                      onPressed: () => {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (_) {
                              return HolocareDialog(
                                title: "홀로케어 리셋",
                                content: "리셋된 데이터는 복구되지 않습니다\n정말 리셋 하시겠습니까?",
                                button: "확인",
                                action: () async {
                                  await userViewModel.deleteUser();
                                  router.popUntilRoot();
                                  router.push(const RootRoute());
                                },
                              );
                            })
                      },
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
