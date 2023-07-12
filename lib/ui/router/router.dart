import 'package:auto_route/auto_route.dart';
import './router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: RootRoute.page,
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
