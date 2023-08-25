// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  final String hintText;
  final String text;
  final dynamic validator;
  final dynamic onSave;
  // final Function(String? value)? onSave;

  CustomTextFiled(
      {this.hintText = '', this.text = '', this.onSave, this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomText(
            text: text,
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
          TextFormField(
            cursorColor: primaryColor,
            onSaved: onSave,
            validator: validator,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.black87),
                fillColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
