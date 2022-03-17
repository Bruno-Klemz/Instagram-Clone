import '../../Data/User/UserModel.dart';

abstract class FeedState {}

class FeedInitialState extends FeedState {}

class FeedFetchedUserState extends FeedState {
  final UserModel user;

  FeedFetchedUserState(
      {required this.user});
}
