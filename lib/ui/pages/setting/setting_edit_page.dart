import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/appbar/holocare_app_bar.dart';
import 'package:holocare/ui/components/clipboard/holocare_clipboard.dart';
import 'package:holocare/ui/components/dialog/holocare_dialog.dart';
import 'package:holocare/ui/components/item/setting_edit_item.dart';
import 'package:holocare/ui/components/item/setting_item.dart';
import 'package:holocare/ui/router/router.gr.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SettingEditPage extends HookConsumerWidget {
  const SettingEditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final theme = ref.watch(holocareThemeProvider);
    final userViewModel = ref.watch(userViewModelProvider);
    final protectos = userViewModel.members
        .where((member) => member.role == Role.protector.role);

    return Scaffold(
      appBar: HolocareAppBar(
        onPressed: () => router.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: Row(
                children: [
                  Text(
                    userViewModel.user?.role == Role.protege.role
                        ? "보호자 등록"
                        : "보호자 연결",
                    style: theme.textTheme.h28.title().bold(),
                  ),
                ],
              ),
            ),
            const Gap(28),
            Flexible(
              flex: 0,
              child: Column(
                children: [
                  const Gap(20),
                  HolocareClipboard(code: userViewModel.user?.code),
                  const Gap(12),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  if (userViewModel.user?.role == Role.protector.role)
                    SettingItem(
                      type: SettingItemType.arrowBtn,
                      title: "연결 끊기",
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return HolocareDialog(
                              title: "연결을 끊으시겠습니까?",
                              content: "삭제한 데이터는 복구되지 않습니다.",
                              button: "확인",
                              action: () async {
                                await userViewModel.deleteUser();
                                router.popUntilRoot();
                                router.push(const RootRoute());
                              },
                            );
                          },
                        );
                      },
                    ),
                  if (userViewModel.user?.role == Role.protege.role)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "보호자 최대 2명까지 등록 가능합니다",
                            style: theme.textTheme.c13.description(),
                          ),
                          const Gap(20),
                          for (int order = 1;
                              order <= protectos.length;
                              order++)
                            SettingEditItem(
                              title: "보호자 $order",
                              order: order,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return HolocareDialog(
                                      title: "연결을 끊으시겠습니까?",
                                      content:
                                          "삭제한 보호자 $order의 데이터는\n복구되지 않습니다.",
                                      button: "확인",
                                      action: () async {
                                        router.pop();
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          const Gap(20),
                        ],
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
