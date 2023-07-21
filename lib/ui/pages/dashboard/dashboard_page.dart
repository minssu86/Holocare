import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:holocare/hooks/use_router.dart';
import 'package:holocare/theme/holocare_text.dart';
import 'package:holocare/theme/holocare_theme.dart';
import 'package:holocare/ui/components/label/holocare_label.dart';
import 'package:holocare/ui/components/layout/holocare_layout.dart';
import 'package:holocare/ui/router/router.gr.dart';
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

    ref.listen(userViewModelProvider, (prev, next) {
      if (!next.isExistProtectorMember || !next.isExistProtegeMember) {
        next.deleteUser().then((_) {
          router.popUntilRoot();
          router.push(const RootRoute());
        });
      }
    });

    useEffect(() {
      userViewModel.updateVisited();
      return;
    }, []);

    useEffect(() {
      memberstreamSub = userViewModel.memberstream(userViewModel.user?.code);
      return () => memberstreamSub?.cancel();
    }, []);

    useEffect(() {
      dashboardViewModel.visiting(userViewModel.members);
      return;
    }, [userViewModel.members]);

    return HolocareLayout(
      actions: true,
      onPressedAppbar: () => router.push(const SettingRoute()),
      title: Text(
        dashboardViewModel.activeLevel.title,
        style: theme.textTheme.h28.title().bold(),
      ),
      description: Text(
        "${dashboardViewModel.diff}시간 전에 활동을 확인했어요",
        style: theme.textTheme.b14.description(),
      ),
      label: HolocareLabel(
        text: dashboardViewModel.activeLevel.text,
        background: dashboardViewModel.activeLevel.background,
        textStyle: dashboardViewModel.activeLevel.textStyle,
      ),
      widgets: [
        Flexible(
          flex: 1,
          child: Column(
            children: [
              const Gap(28),
              Image(
                image: AssetImage(
                    "assets/images/${dashboardViewModel.activeLevel.image}"),
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
          ),
        ),
      ],
    );
  }
}
