abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginErrorState extends LoginState {
  final String? errorMessage;

  LoginErrorState(this.errorMessage);
}

