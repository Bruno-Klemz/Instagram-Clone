import 'package:flutter/material.dart';

import '../NavigationBLoC/PerfilNavigationEvent.dart';

class PerfilPageNavigator {
  void navigate(PerfilNavigationEvent event, {Object? arguments}) {
    switch (event.runtimeType) {
      case PerfilNavigationSwitchToFeedEvent:
        final castedEvent = event as PerfilNavigationSwitchToFeedEvent;
        final String _routeName = 'toFeed';
        Navigator.of(castedEvent.context).popAndPushNamed(
          _routeName,
          arguments: arguments,
        );
    }
  }
}