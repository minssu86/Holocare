import 'package:auto_route/auto_route.dart';
import 'package:holocare/ui/router/guard/auth_guard.dart';
import 'package:holocare/ui/vm/user_view_model.dart';
import './router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  final UserViewModel userViewModel;

  RootRouter({required this.userViewModel});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: RootRoute.page,
          guards: [AuthGuard(userViewModel: userViewModel)],
        ),
        AutoRoute(
          page: RootProtegeRoute.page,
          path: "/protege",
        ),
        AutoRoute(
          page: RootProtectorRoute.page,
          path: "/protector",
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: "/dashboard",
        ),
        AutoRoute(
          page: SettingRoute.page,
          path: "/setting",
        ),
      ];
}
