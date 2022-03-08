import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'LoginModule/BLoC/ViewBLoC/LoginBloc.dart';
import 'LoginModule/BLoC/ViewBLoC/LoginState.dart';

class AppBlocProvider {
  List<BlocProvider> getAppBlocProvider() {
    List<BlocProvider> blocProviderList = [
      BlocProvider<LoginBloc>(
          create: (BuildContext context) =>
              LoginBloc(LoginInitialState())),
    ];
    return blocProviderList;
  }
}
