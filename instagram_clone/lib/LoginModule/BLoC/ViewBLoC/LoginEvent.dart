import 'package:flutter/cupertino.dart';

abstract class LoginEvent {}

class LoginEmailEvent extends LoginEvent {
  final String login, password;
  final BuildContext context;

  LoginEmailEvent(this.login, this.password, this.context);
}

class LoginErrorEvent extends LoginEvent {
  final String errorMessage;

  LoginErrorEvent(this.errorMessage);
}
