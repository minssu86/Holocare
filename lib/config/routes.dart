import 'package:flutter/material.dart';
import 'package:holocare/pages/protectee/code.dart';
import 'package:holocare/pages/protectee/setting.dart';
import 'package:holocare/pages/protector/code.dart';
import 'package:holocare/pages/protector/setting.dart';
import 'package:holocare/pages/select_role_screen.dart';
import 'package:holocare/pages/init_screen.dart';

import '../pages/protectee/connect.dart';
import '../pages/protector/connect.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => InitScreen());
      case '/select_role':
        return MaterialPageRoute(builder: (_) => const SelectRoleScreen());
      case '/protectee/code':
        return MaterialPageRoute(builder: (_) => const ProtecteeCodeScreen());
      case '/protector/code':
        return MaterialPageRoute(builder: (_) => const ProtectorCodeScreen());
      case '/protectee/setting':
        return MaterialPageRoute(
            builder: (_) => const ProtecteeSettingScreen());
      case '/protector/setting':
        return MaterialPageRoute(
            builder: (_) => const ProtectorSettingScreen());
      case '/protectee/connect':
        return MaterialPageRoute(builder: (_) => const ProtecteeConnect());
      case '/protector/connect':
        return MaterialPageRoute(builder: (_) => const ProtectorConnect());

      default:
        return MaterialPageRoute(builder: (_) => InitScreen());
    }
  }
}
