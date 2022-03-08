import 'package:flutter/material.dart';

import 'LoginModule/View/LoginView.dart';

class AppRouter {
  static Route? navigate(RouteSettings settings) {
    switch (settings.name) {
      case 'initialRoute':
        return MaterialPageRoute(builder: (_) => Login());
      default:
        return null;
    }
  }
}