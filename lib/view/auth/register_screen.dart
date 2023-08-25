import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_Button.dart';
import '../widgets/custom_form_text_filed.dart';
import '../widgets/custom_text.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.off(LoginScreen());
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              CustomText(
                text: "Sign Up",
                fontSize: 30,
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextFiled(
                text: 'User Name',
                hintText: 'Baraa Aldarsani',
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  // print("Error");
                },
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
                height: 40,
              ),
              CustomButton(
                text: "SIGN UP",
                onPressed: () {
                  _formkey.currentState!.save();
                  if (_formkey.currentState!.validate()) {
                    controller.createAccount();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
