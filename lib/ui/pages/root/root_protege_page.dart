import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:holocare/foundation/constants.dart';
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
    final router = useRouter();
    final userViewModel = ref.watch(userViewModelProvider);
    late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
        memberstreamSub;

    useEffect(() {
      memberstreamSub = userViewModel.memberstream(userViewModel.user?.code);
      return memberstreamSub?.cancel;
    }, []);

    useEffect(() {
      if (userViewModel.members
          .where((element) => element.role == Role.protector.role)
          .isNotEmpty) router.push(const DashboardRoute());
      return null;
    }, [userViewModel.members]);

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
