// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class CustomButtonSocail extends StatelessWidget {
  final String text;
  final String imageName;
  final dynamic onPressed;
  CustomButtonSocail({this.text = '', this.imageName = '', this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      height: 50,
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Image.asset(imageName), Text(text)],
        ),
      ),
    );
  }
}
