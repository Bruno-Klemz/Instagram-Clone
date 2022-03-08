import 'package:bloc/bloc.dart';

import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc(LoginState initialState) : super(initialState);
}