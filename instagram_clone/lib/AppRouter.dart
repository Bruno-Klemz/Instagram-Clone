import 'package:flutter/material.dart';
import 'package:instagram_clone/PerfilModule/View/PerfilView.dart';

import 'FeedModule/View/FeedView.dart';
import 'LoginModule/View/LoginView.dart';

class AppRouter {
  static Route? navigate(RouteSettings settings) {
    switch (settings.name) {
      case 'initialRoute':
        return MaterialPageRoute(builder: (_) => Login());

      case 'toFeed':
        return MaterialPageRoute(builder: (_) => Feed());

      case 'toPerfil':
        return MaterialPageRoute(builder: (_) => Perfil());
      default:
        return null;
    }
  }
}