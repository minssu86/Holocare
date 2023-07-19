import 'package:flutter/material.dart';
import 'package:holocare/pages/code_page.dart';
import 'package:holocare/pages/connect_page.dart';
import 'package:holocare/pages/main_page.dart';
import 'package:holocare/pages/role_page.dart';
import 'package:holocare/pages/setting_page.dart';
import 'package:holocare/pages/splash_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: routeSettings,
        );
      case '/select_role':
        return MaterialPageRoute(
          builder: (_) => const SelectRolePage(),
          settings: routeSettings,
        );
      case '/code':
        return MaterialPageRoute(
          builder: (_) => const CodePage(),
          settings: routeSettings,
        );
      case '/setting':
        return MaterialPageRoute(
          builder: (_) => const SettingPage(),
          settings: routeSettings,
        );
      case '/connect':
        return MaterialPageRoute(
          builder: (_) => const ConnectPage(),
          settings: routeSettings,
        );
      case '/main':
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
          settings: routeSettings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: routeSettings,
        );
    }
  }
}
