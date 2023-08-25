import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/cart_view.dart';
import '../../view/profile_view.dart';
import '../../view/home_view.dart';

class ControlViewModel extends GetxController {
  int _navigationbar = 0;
  Widget _currentScreen = HomeView();

  get navigationValue => _navigationbar;

  get currentScreen => _currentScreen;

  void changeSelectedValue(int selected) {
    _navigationbar = selected;
    update();
    switch (selected) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartView();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileView();
          break;
        }
    }
  }
}
