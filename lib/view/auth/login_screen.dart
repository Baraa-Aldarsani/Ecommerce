// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/register_screen.dart';
import 'package:e_commerce/view/widgets/custom_Button.dart';
import 'package:e_commerce/view/widgets/custom_button_social.dart';
import 'package:e_commerce/view/widgets/custom_form_text_filed.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome,",
                    fontSize: 30,
                  ),
                  MaterialButton(onPressed: (){
                    Get.to(RegisterScreen());
                  },child:CustomText(
                    text: "Sign Up",
                    fontSize: 20,
                    color: primaryColor,
                  ) ,),

                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Sign in to Continue",
                color: Colors.grey,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFiled(
                text: 'Email',
                hintText: 'baraa@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  // print("Error");
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFiled(
                text: 'Password',
                hintText: '************',
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  // print("Error");
                },
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                text: "Forget Password?",
                alignment: Alignment.topRight,
                fontSize: 13,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "SIGN IN",
                onPressed: () {
                  _formkey.currentState!.save();
                  if(_formkey.currentState!.validate()){
                    controller.signInWithEmailAndPassowrd();
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: "-OR-",
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtonSocail(
                text: "Sign in with Facebook",
                imageName: "assets/images/facebook.png",
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              CustomButtonSocail(
                text: "Sign in with google  ",
                imageName: "assets/images/google.png",
                onPressed: () {
                  controller.signInWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
