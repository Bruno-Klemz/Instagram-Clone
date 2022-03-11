import 'package:flutter/material.dart';

class TextDesign{
  Text buildText(String title, double fontSize, FontWeight fontWeight, Color? color) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'Proxima Nova',
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color),
    );
  }
}