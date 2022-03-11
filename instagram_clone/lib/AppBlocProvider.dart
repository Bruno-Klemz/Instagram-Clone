import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/LoginModule/NavigationBLoC/LoginNavigationBloc.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilBloc.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilState.dart';

import 'AuthModule/Auth.dart';
import 'LoginModule/BLoC/ViewBLoC/LoginBloc.dart';
import 'LoginModule/BLoC/ViewBLoC/LoginState.dart';
import 'LoginModule/Navigator/LoginPageNavigator.dart';

class AppBlocProvider {
  List<BlocProvider> getAppBlocProvider() {
    List<BlocProvider> blocProviderList = [
      BlocProvider<LoginBloc>(
          create: (BuildContext context) =>
              LoginBloc(LoginInitialState(), Auth())),
      BlocProvider<LoginNavigationBloc>(
          create: (BuildContext context) =>
              LoginNavigationBloc(LoginInitialState(), LoginPageNavigator())),
      BlocProvider<PerfilBloc>(
          create: (BuildContext context) => PerfilBloc(PerfilInitialState())),
    ];
    return blocProviderList;
  }
}
