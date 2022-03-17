import 'package:bloc/bloc.dart';
import 'package:instagram_clone/PerfilModule/BLoC/ViewBLoC/PerfilState.dart';

import '../Navigator/PerfilNavigator.dart';
import 'PerfilNavigationEvent.dart';

class PerfilNavigationBloc extends Bloc<PerfilNavigationEvent, PerfilState> {
  PerfilNavigationBloc(PerfilState initialState, PerfilPageNavigator navigator)
      : super(initialState) {
    on<PerfilNavigationSwitchToFeedEvent>((event, emit) => navigator.navigate(event, arguments: event.user));
  }
}
