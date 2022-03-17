import 'package:flutter/material.dart';
import 'package:instagram_clone/Data/User/UserModel.dart';

abstract class PerfilNavigationEvent {}

class PerfilNavigationSwitchToFeedEvent extends PerfilNavigationEvent {
  final BuildContext context;
  final UserModel user;

  PerfilNavigationSwitchToFeedEvent({required this.context, required this.user});
}
