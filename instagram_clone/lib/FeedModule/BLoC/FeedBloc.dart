import 'package:bloc/bloc.dart';

import '../../Data/User/UserModel.dart';
import '../../Data/User/UserRepository.dart';
import 'FeedEvent.dart';
import 'FeedState.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc(FeedState initialState, UserRepository repo) : super(initialState) {
    on<FeedFetchUserEvent>((event, emit) async {
      UserModel user = await repo.fetchUser();
      emit(FeedFetchedUserState(user: user
          ));
    });
  }
}
