import 'package:flutter/cupertino.dart';

abstract class LoginNavigationEvent {}

class LoginSwitchToFeedEvent extends LoginNavigationEvent {
  final BuildContext context;

  LoginSwitchToFeedEvent(this.context);
}
