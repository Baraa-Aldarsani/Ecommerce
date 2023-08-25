import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';

class CheckOutViewModel extends GetxController{
  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  Color getColor(int i) {
    if (i == index) {
      return inProgressColor;
    } else if (i < index) {
      return Colors.teal;
    } else {
      return todoColor;
    }
  }
}