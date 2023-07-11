import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:holocare/domain/model/user.dart';
import 'package:holocare/domain/use_case/member_stream_use_case.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/appbar/holocare_app_bar.dart';
import 'package:holocare/ui/components/button/holocare_button.dart';
import 'package:holocare/ui/router/router.gr.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RootProtegePage extends HookConsumerWidget {
  const RootProtegePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);
    final userViewModel = ref.watch(userViewModelProvider);
    final memberstream = ref.watch(memberStreamUserUseCaseProvider);
    final router = useRouter();

    /**
     * @todo
     * stream 구독 로직 뷰에서 분리
     */

    late final StreamSubscription<Future<QuerySnapshot<Map<String, dynamic>>>>
        subscription;

    memberstream.whenData(
      (member) {
        subscription = member(userViewModel.user!.code!).listen(
          (event) {
            event.then(
              (value) {
                if (value.docs.map((e) => User.fromJson(e.data())).length >=
                    2) {
                  subscription.cancel();
                  router.replace(const DashboardRoute());
                }
              },
            );
          },
        );
      },
    );

    return Scaffold(
      appBar: HolocareAppBar(
        onPressed: () async =>
            await userViewModel.deleteUser().then((_) => router.pop()),
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "보호자에게 코드를\n공유해주세요",
                            style: theme.textTheme.h22.bold().title(),
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
            Flexible(
              flex: 0,
              child: Column(
                children: [
                  const Gap(60),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: theme.appColors.grayscale_04,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: theme.appColors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${userViewModel.user?.code}',
                            style: theme.textTheme.h22.bold().title(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(60),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: HolocareButton(
                title: "복사하기",
                onTap: () async {
                  await Clipboard.setData(
                    ClipboardData(text: "${userViewModel.user!.code}"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
