import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/view_model/control_view_model.dart';

class ControView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControlViewModel>(
              init: ControlViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Icon(Icons.add),
              ),
              label: ".",
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Explor"),
              )),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Icon(Icons.shopping_cart),
              ),
              label: "",
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text("Cart"),
              )),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Icon(Icons.account_circle_outlined),
              ),
              label: "",
              activeIcon: Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Account",
                ),
              )),
        ],
        currentIndex: controller.navigationValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
      ),
    );
  }
}
