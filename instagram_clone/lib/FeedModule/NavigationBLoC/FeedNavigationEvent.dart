import 'package:flutter/material.dart';
import 'package:instagram_clone/Data/User/UserModel.dart';

abstract class FeedNavigationEvent {}

class FeedNavigationSwitchToPerfilEvent extends FeedNavigationEvent {
  final BuildContext context;
  final UserModel user;

  FeedNavigationSwitchToPerfilEvent({required this.context, required this.user});
}
