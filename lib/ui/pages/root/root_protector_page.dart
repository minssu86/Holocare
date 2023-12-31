import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/button/holocare_button.dart';
import 'package:holocare/ui/components/dialog/holocare_dialog.dart';
import 'package:holocare/ui/components/layout/holocare_layout.dart';
import 'package:holocare/ui/components/text_field/holocare_pin_code_field.dart';
import 'package:holocare/ui/router/router.gr.dart';
import 'package:holocare/ui/vm/root_view_model.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RootProtectorPage extends HookConsumerWidget {
  const RootProtectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);
    final userViewModel = ref.watch(userViewModelProvider);
    final rootViewModel = ref.watch(rootViewModelProvider);
    final router = useRouter();

    return HolocareLayout(
      onPressedAppbar: () async =>
          await userViewModel.deleteUser().then((_) => router.pop()),
      leading: true,
      title: Text(
        "코드를 입력해주세요",
        style: theme.textTheme.h22.bold().title(),
      ),
      description: Text(
        "보호 대상자에게서 공유 받은 코드를 입력해주세요",
        style: theme.textTheme.b14.description(),
      ),
      widgets: [
        Flexible(
          flex: 0,
          child: Column(
            children: [
              const Gap(60),
              HolocarePinCodeField(
                onChanged: (value) => rootViewModel.changeCode(value),
              ),
              const Gap(60),
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: HolocareButton(
            title: "연결하기",
            onTap: () async {
              if (!rootViewModel.isNotEmptyCode) {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) {
                      return HolocareDialog(
                        title: "코드를 입력해주세요",
                        content: "코드를 입력하여 다음 스텝으로\n넘어갈 수 있습니다",
                        button: "확인",
                        action: () {
                          router.pop();
                        },
                      );
                    });
                return;
              }
              await userViewModel
                  .getUsersByCode(int.parse(rootViewModel.code))
                  .then(
                (_) {
                  if (!userViewModel.isExistProtegeMember) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (_) {
                        return HolocareDialog(
                          title: "연결에 실패하였습니다",
                          content: "존재하지 않는 코드입니다",
                          button: "확인",
                          action: () {
                            router.pop();
                          },
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) {
                        return HolocareDialog(
                          title: "연결에 성공하였습니다",
                          content: "보호자가 코드를 입력하여\n연결되었습니다",
                          button: "확인",
                          action: () async {
                            await userViewModel
                                .verify(int.parse(rootViewModel.code));
                            router.replace(const DashboardRoute());
                          },
                        );
                      },
                    );
                  }
                },
              );
            },
          ),
        )
      ],
    );
  }
}
