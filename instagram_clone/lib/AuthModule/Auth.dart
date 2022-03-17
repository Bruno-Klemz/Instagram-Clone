import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/LoginModule/BLoC/ViewBLoC/LoginEvent.dart';

import '../LoginModule/BLoC/ViewBLoC/LoginBloc.dart';
import '../LoginModule/NavigationBLoC/LoginNavigationBloc.dart';
import '../LoginModule/NavigationBLoC/LoginNavigationEvent.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signInWithEmail(LoginEmailEvent event) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.login, password: event.password);
              
      BlocProvider.of<LoginNavigationBloc>(event.context)
          .add(LoginSwitchToFeedEvent(event.context));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        BlocProvider.of<LoginBloc>(event.context)
          .add(LoginErrorEvent(e.code));
      } else if (e.code == 'wrong-password') {
        BlocProvider.of<LoginBloc>(event.context)
          .add(LoginErrorEvent(e.code));
      }
    }
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
