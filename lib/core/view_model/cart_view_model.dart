import 'package:e_commerce/core/services/database/cart_database_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var dbHelper = CartDataBaseHelper.db;

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CartProductModel> get cartProductModel => _cartProductModel;
  List<CartProductModel> _cartProductModel = [];

  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _cartProductModel.length; i++) {
      _totalPrice += (double.parse(_cartProductModel[i].price) *
          _cartProductModel[i].quantity);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel.length; i++) {
      if (_cartProductModel[i].productId == cartProductModel.productId) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice +=
        (double.parse(cartProductModel.price) * cartProductModel.quantity);

    update();
  }

  increaseQuantity(int index) async {
    _cartProductModel[index].quantity++;
    _totalPrice += (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);
    update();
  }

  decreaseQuantity(int index) async {
    _cartProductModel[index].quantity--;
    _totalPrice -= (double.parse(_cartProductModel[index].price));
    await dbHelper.updateProduct(_cartProductModel[index]);

    update();
  }
}
