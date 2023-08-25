import 'dart:convert';

import 'package:e_commerce/constant.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var value = preferences.getString(CHARED_DATA_STORAGE);
    return UserModel.fromJson(json.decode(value!));
  }

  setUser(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(
        CHARED_DATA_STORAGE, jsonEncode(userModel.toJson()));
  }

  void deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
