import 'package:flutter/material.dart';
import 'package:instagram_clone/LoginModule/NavigationBLoC/LoginNavigationEvent.dart';

class LoginPageNavigator {
  void navigate(LoginNavigationEvent event, {List<Object>? arguments}) {
    switch (event.runtimeType) {
      case LoginSwitchToFeedEvent:
        final castedEvent = event as LoginSwitchToFeedEvent;
        final String _routeName = 'toFeed';
        Navigator.of(castedEvent.context).popAndPushNamed(
          _routeName,
          arguments: arguments,
        );
    }
  }
}