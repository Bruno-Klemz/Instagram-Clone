import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/DesignSystem/TextDesign.dart';
import 'package:instagram_clone/DesignSystem/TextInputDesign.dart';
import 'package:instagram_clone/LoginModule/BLoC/ViewBLoC/LoginBloc.dart';
import 'package:instagram_clone/LoginModule/BLoC/ViewBLoC/LoginEvent.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final textDesign = TextDesign();

  final layoutConstrains = LoginLayoutConstrains();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double horizontalPadding = MediaQuery.of(context).size.width * 0.075;
    layoutConstrains.horizontalPadding = horizontalPadding;

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildMainContainer(), _buildBottomContainer()],
      )),
    );
  }

  Widget _buildMainContainer() {
    final textInputDesign = TextInputDesign(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: layoutConstrains.horizontalPadding),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: layoutConstrains.verticalPadding),
              child: textDesign.buildText(
                  "português (Brasil)", 12, FontWeight.w300, Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(top: layoutConstrains.gigaWidgetPadding),
              child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.asset('assets/Instagram-Logo.png')),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: layoutConstrains.mediumWidgetPadding),
              child: textInputDesign.buildTextInput(
                  "Número de telefone, email ou nome de usuário",
                  loginController),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: layoutConstrains.minorWidgetPadding),
              child: textInputDesign.buildTextInput("Senha", passwordController,
                  icon: Icons.lock),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: layoutConstrains.minorWidgetPadding),
                child: SizedBox(
                    height: 41,
                    width: MediaQuery.of(context).size.width,
                    child: _buildLoginButton())),
            Padding(
              padding:
                  EdgeInsets.only(top: layoutConstrains.mediumWidgetPadding),
              child: _buildForgotLoginRichText(),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: layoutConstrains.mediumWidgetPadding),
              child: _buildDivider(),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: layoutConstrains.majorWidgetPadding),
              child: _buildFacebookLogin(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomContainer() {
    return Padding(
      padding: EdgeInsets.only(bottom: layoutConstrains.mediumWidgetPadding),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: layoutConstrains.mediumWidgetPadding),
              child: _buildRegisterRichText(),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildLoginButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue[100]),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LoginEmailEvent(
              loginController.text, passwordController.text, context));
        },
        child: textDesign.buildText(
            "Entrar", 14, FontWeight.w100, Colors.grey[400]));
  }

  Widget _buildForgotLoginRichText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: "Esqueceu seus dados de login? ",
          style: TextStyle(
              color: Colors.grey, fontSize: 13, fontFamily: "Proxima Nova"),
          children: <TextSpan>[
            TextSpan(
              recognizer: new TapGestureRecognizer()..onTap = () => {},
              text: 'Obtenha ajuda para entrar',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 13),
            ),
          ]),
    );
  }

  Row _buildDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: layoutConstrains.minorWidgetPadding,
              right: layoutConstrains.minorWidgetPadding),
          child:
              textDesign.buildText("OU", 16, FontWeight.bold, Colors.grey[600]),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildFacebookLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 25,
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/facebook_logo.png",
                color: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: textDesign.buildText(
                    "Entrar com o Facebook", 14, FontWeight.bold, Colors.blue),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterRichText() {
    return RichText(
      text: TextSpan(
          text: "Não tem uma conta? ",
          style: TextStyle(
              color: Colors.grey, fontSize: 13, fontFamily: "Proxima Nova"),
          children: <TextSpan>[
            TextSpan(
              recognizer: new TapGestureRecognizer()..onTap = () => {},
              text: 'Cadastre-se',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 13),
            ),
          ]),
    );
  }
}

class LoginLayoutConstrains {
  late double horizontalPadding;
  double verticalPadding = 15.0,
      textPadding = 5.0,
      minorWidgetPadding = 10.0,
      mediumWidgetPadding = 15.0,
      majorWidgetPadding = 30.0,
      gigaWidgetPadding = 150.0,
      storiesCardSize = 25.0,
      perfilImageSize = 35.0,
      downwardArrowIconSize = 24.0;
  LoginLayoutConstrains();
}
