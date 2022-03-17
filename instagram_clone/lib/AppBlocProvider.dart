import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/Data/User/UserRepository.dart';
import 'package:instagram_clone/LoginModule/NavigationBLoC/LoginNavigationBloc.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilBloc.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilState.dart';
import 'package:instagram_clone/PerfilModule/NavigationBLoC/PerfilNavigationBloc.dart';

import 'AuthModule/Auth.dart';
import 'Data/User/UserAPI.dart';
import 'FeedModule/BLoC/FeedBloc.dart';
import 'FeedModule/BLoC/FeedState.dart';
import 'FeedModule/Navigation/FeedPageNavigator.dart';
import 'FeedModule/NavigationBLoC/FeedNavigationBloc.dart';
import 'LoginModule/BLoC/ViewBLoC/LoginBloc.dart';
import 'LoginModule/BLoC/ViewBLoC/LoginState.dart';
import 'LoginModule/Navigator/LoginPageNavigator.dart';
import 'PerfilModule/Navigator/PerfilNavigator.dart';

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
          create: (BuildContext context) => PerfilBloc(PerfilInitialState(), UserRepository(UserAPI()))),

      BlocProvider<FeedBloc>(
          create: (BuildContext context) => FeedBloc(FeedInitialState(), UserRepository(UserAPI()))),

      BlocProvider<FeedNavigationBloc>(
          create: (BuildContext context) =>
              FeedNavigationBloc(FeedInitialState(), FeedPageNavigator())),

    BlocProvider<PerfilNavigationBloc>(
          create: (BuildContext context) =>
              PerfilNavigationBloc(PerfilInitialState(), PerfilPageNavigator())),
    ];
    return blocProviderList;
  }
}
