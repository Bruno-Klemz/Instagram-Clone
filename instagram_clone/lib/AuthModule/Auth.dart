import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/LoginModule/BLoC/ViewBLoC/LoginEvent.dart';
import 'package:instagram_clone/LoginModule/NavigationBLoC/LoginNavigationBloc.dart';
import 'package:instagram_clone/LoginModule/NavigationBLoC/LoginNavigationEvent.dart';

class Auth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signInWithEmail(LoginEmailEvent event) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: event.login, password: event.password);

      print(userCredential.user?.email);
      print(userCredential.user?.uid);
      BlocProvider.of<LoginNavigationBloc>(event.context)
          .add(LoginSwitchToFeedEvent(event.context));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<void> registerWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
