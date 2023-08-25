// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final int maxLine;
  final double? height;

  CustomText(
      {this.text = '',
      this.fontSize = 16,
      this.color = Colors.black,
      this.alignment = Alignment.topLeft,
      this.maxLine = 1,
      this.height = 1,});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: color,height: height),
        maxLines: maxLine,
      ),
    );
  }
}
