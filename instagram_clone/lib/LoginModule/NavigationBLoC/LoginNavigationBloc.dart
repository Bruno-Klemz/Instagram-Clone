import 'package:bloc/bloc.dart';
import 'package:instagram_clone/LoginModule/BLoC/ViewBLoC/LoginState.dart';
import 'package:instagram_clone/LoginModule/NavigationBLoC/LoginNavigationEvent.dart';
import 'package:instagram_clone/LoginModule/Navigator/LoginPageNavigator.dart';

class LoginNavigationBloc extends Bloc<LoginNavigationEvent, LoginState> {
  LoginNavigationBloc(LoginState initialState, LoginPageNavigator navigator) : super(initialState) {
    on<LoginSwitchToFeedEvent>((event, emit) => navigator.navigate(event));
  }
}
