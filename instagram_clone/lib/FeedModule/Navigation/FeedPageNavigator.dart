import 'package:flutter/material.dart';

import '../NavigationBLoC/FeedNavigationEvent.dart';

class FeedPageNavigator {
  void navigate(FeedNavigationEvent event, {Object? arguments}) {
    switch (event.runtimeType) {
      case FeedNavigationSwitchToPerfilEvent:
        final castedEvent = event as FeedNavigationSwitchToPerfilEvent;
        final String _routeName = 'toPerfil';
        Navigator.of(castedEvent.context).popAndPushNamed(
          _routeName,
          arguments: arguments,
        );
    }
  }
}