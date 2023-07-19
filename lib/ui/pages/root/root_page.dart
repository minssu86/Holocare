import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/foundation/constants.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/button/holocare_button.dart';
import 'package:holocare/ui/components/card/role_card.dart';
import 'package:holocare/ui/components/dialog/holocare_dialog.dart';
import 'package:holocare/ui/components/layout/holocare_layout.dart';
import 'package:holocare/ui/router/router.gr.dart';
import 'package:holocare/ui/vm/root_view_model.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RootPage extends HookConsumerWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final theme = ref.watch(holocareThemeProvider);
    final userViewModel = ref.watch(userViewModelProvider);
    final rootViewModel = ref.watch(rootViewModelProvider);

    return HolocareLayout(
      title: Text(
        "역할을 선택해주세요",
        style: theme.textTheme.h22.bold().title(),
      ),
      description: Text(
        "역할을 수정할 수 없으니 신중하게 선택해주세요",
        style: theme.textTheme.b14.description(),
      ),
      widgets: [
        Flexible(
          flex: 0,
          child: Column(
            children: [
              const Gap(60),
              RoleCard(
                title: "보호 대상자 / 피보호자",
                description: "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다",
                active: rootViewModel.isProtege,
                onTap: () => rootViewModel.changeRole(Role.protege),
              ),
              const Gap(12),
              RoleCard(
                title: "보호자",
                description: "보호자는 보호대상자의 활동이 감지되지 않으면 알림을 받습니다",
                active: rootViewModel.isProtector,
                onTap: () => rootViewModel.changeRole(Role.protector),
              ),
              const Gap(60),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: HolocareButton(
            title: "다음",
            onTap: () {
              if (rootViewModel.role == null) {
                showDialog(
                    context: context,
                    builder: (_) {
                      return HolocareDialog(
                        title: "역할을 선택해주세요",
                        content: "역할을 선택하여 다음 스텝으로\n넘어갈 수 있습니다",
                        button: "확인",
                        action: () {
                          router.pop();
                        },
                      );
                    });
              }
              userViewModel.createUser(rootViewModel.role!).then((_) {
                if (rootViewModel.role == Role.protege) {
                  router.push(const RootProtegeRoute());
                } else {
                  router.push(const RootProtectorRoute());
                }
              });
            },
          ),
        )
      ],
    );
  }
}
