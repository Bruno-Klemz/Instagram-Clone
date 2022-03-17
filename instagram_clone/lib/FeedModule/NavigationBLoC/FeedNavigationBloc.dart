import 'package:bloc/bloc.dart';

import '../BLoC/FeedState.dart';
import '../Navigation/FeedPageNavigator.dart';
import 'FeedNavigationEvent.dart';

class FeedNavigationBloc extends Bloc<FeedNavigationEvent, FeedState> {
  FeedNavigationBloc(FeedState initialState, FeedPageNavigator navigator) : super(initialState) {
    on<FeedNavigationSwitchToPerfilEvent>((event, emit) => navigator.navigate(event, arguments: event.user));
  }
}
