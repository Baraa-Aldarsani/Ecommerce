// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, file_names

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final dynamic onPressed;
  CustomButton({this.text = '', this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        color: primaryColor,
        child: CustomText(
          text: text,
          alignment: Alignment.center,
          color: Colors.white,
        ),
      ),
    );
  }
}
