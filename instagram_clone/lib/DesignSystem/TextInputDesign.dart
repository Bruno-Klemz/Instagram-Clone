import 'package:flutter/material.dart';

class TextInputDesign {
  final BuildContext context;

  TextInputDesign(this.context);

  Widget buildTextInput(String label, TextEditingController controller,
      {IconData? icon}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 41,
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
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
