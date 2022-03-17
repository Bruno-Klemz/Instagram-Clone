import 'package:flutter/material.dart';

import '../LoginModule/BLoC/ViewBLoC/LoginState.dart';

class TextInputDesign {
  final BuildContext context;

  TextInputDesign(this.context);

  Widget buildTextInput(
      String label, TextEditingController controller, LoginState state,
      {IconData? icon}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 41,
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        obscureText: label == "Senha" ? true: false,
        validator: (String? value) {
          switch (state.runtimeType) {
            case LoginErrorState:
              final _castedState = state as LoginErrorState;
              if (label == "Número de telefone, email ou nome de usuário" &&
                  _castedState.errorMessage == "user-not-found") {
                return "Nenhum usuário encontrado para esse email";
              } else if (label == "Senha" &&
                  _castedState.errorMessage == "user-wrong-password-found") {
                return "Senha incorreta";
              }
              return "";
            default:
              return "";
          }
        },
        decoration: InputDecoration(
            suffixIcon: icon != null ? Icon(icon) : null,
            labelText: label,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w100,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }
}
