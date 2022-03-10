import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilBloc.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilState.dart';

import 'LoginModule/BLoC/ViewBLoC/LoginBloc.dart';
import 'LoginModule/BLoC/ViewBLoC/LoginState.dart';

class AppBlocProvider {
  List<BlocProvider> getAppBlocProvider() {
    List<BlocProvider> blocProviderList = [
      BlocProvider<LoginBloc>(
          create: (BuildContext context) =>
              LoginBloc(LoginInitialState())),

      BlocProvider<PerfilBloc>(
          create: (BuildContext context) =>
              PerfilBloc(PerfilInitialState())),
    ];
    return blocProviderList;
  }
}
