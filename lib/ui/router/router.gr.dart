// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:holocare/ui/pages/dashboard/dashboard_page.dart' as _i1;
import 'package:holocare/ui/pages/root/root_page.dart' as _i4;
import 'package:holocare/ui/pages/root/root_protector_page.dart' as _i2;
import 'package:holocare/ui/pages/root/root_protege_page.dart' as _i3;

abstract class $RootRouter extends _i5.RootStackRouter {
  $RootRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    RootProtectorRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RootProtectorPage(),
      );
    },
    RootProtegeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RootProtegePage(),
      );
    },
    RootRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RootPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i5.PageRouteInfo<void> {
  const DashboardRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.RootProtectorPage]
class RootProtectorRoute extends _i5.PageRouteInfo<void> {
  const RootProtectorRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RootProtectorRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootProtectorRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RootProtegePage]
class RootProtegeRoute extends _i5.PageRouteInfo<void> {
  const RootProtegeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RootProtegeRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootProtegeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RootPage]
class RootRoute extends _i5.PageRouteInfo<void> {
  const RootRoute({List<_i5.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
