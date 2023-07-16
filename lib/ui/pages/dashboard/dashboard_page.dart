import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/appbar/dashboard_app_bar.dart';
import 'package:holocare/ui/components/label/holocare_label.dart';
import 'package:holocare/ui/vm/dashboard_view_model.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(holocareThemeProvider);
    final router = useRouter();
    final userViewModel = ref.watch(userViewModelProvider);
    final dashboardViewModel = ref.watch(dashboardViewModelProvider);
    late final StreamSubscription<QuerySnapshot<Map<String, dynamic>>>?
        memberstreamSub;

    useEffect(() {
      userViewModel.updateVisited();
      return null;
    }, []);

    useEffect(() {
      memberstreamSub = userViewModel.memberstream(userViewModel.user?.code);
      return () => memberstreamSub?.cancel();
    }, []);

    useEffect(() {
      dashboardViewModel.visiting(userViewModel.members);
      return null;
    }, [userViewModel.members]);

    return Scaffold(
      appBar: DashBoardAppBar(),
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
                      Text(
                        "안전하게\n보호하고 있어요",
                        style: theme.textTheme.h28.title().bold(),
                      ),
                      const Gap(16),
                      Text(
                        "${dashboardViewModel.diff}시간 전에 활동을 확인했어요",
                        style: theme.textTheme.b14.description(),
                      ),
                    ],
                  ),
                  HolocareLabel(
                    text: "안전",
                    background: theme.appColors.successSecondary,
                    textStyle: theme.textTheme.b14.success().semiBold(),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 1,
                child: Column(
                  children: [
                    const Gap(28),
                    const Image(
                      image: AssetImage("assets/images/buddy_safety.png"),
                      fit: BoxFit.fitWidth,
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "최근 접속",
                          style: theme.textTheme.c13.description(),
                        ),
                        const Gap(4),
                        Text(
                          dashboardViewModel.visited,
                          style: theme.textTheme.c13.description().semiBold(),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
