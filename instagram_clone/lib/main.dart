import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/AppBlocProvider.dart';
import 'package:instagram_clone/AppRouter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiBlocProvider(
      providers: AppBlocProvider().getAppBlocProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'initialRoute',
        onGenerateRoute: AppRouter.navigate,
      )));
}