import 'package:flutter/material.dart';
import 'package:instagram_clone/PerfilModule/View/PerfilView.dart';

import 'Data/User/UserModel.dart';
import 'FeedModule/View/FeedView.dart';
import 'LoginModule/View/LoginView.dart';

class AppRouter {
  static Route? navigate(RouteSettings settings) {
    switch (settings.name) {
      case 'initialRoute':
        return MaterialPageRoute(builder: (_) => Login());

      case 'toFeed':
        if (settings.arguments != null) {
          UserModel _castedArguments = settings.arguments as UserModel;
          return MaterialPageRoute(builder: (_) => Feed(user: _castedArguments));
        }
        else{
          return MaterialPageRoute(builder: (_) => Feed());
        }

      case 'toPerfil':
        final _castedArguments = settings.arguments as UserModel;
        return MaterialPageRoute(
            builder: (_) => Perfil(user: _castedArguments));
      default:
        return null;
    }
  }
}
