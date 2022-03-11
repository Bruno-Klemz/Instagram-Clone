import 'package:bloc/bloc.dart';
import 'package:instagram_clone/AuthModule/Auth.dart';

import 'LoginEvent.dart';
import 'LoginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState, Auth _auth) : super(initialState) {
    on<LoginEmailEvent>((event, emit) => _auth.signInWithEmail(event));
  }
}
