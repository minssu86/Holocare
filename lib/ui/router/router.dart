import 'package:auto_route/auto_route.dart';
import './router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RootRouter extends $RootRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: RootRoute.page,
          path: "/",
          initial: true,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: "/dashboard",
        ),
        RedirectRoute(path: "*", redirectTo: "/"),
      ];
}
