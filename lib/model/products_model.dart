import 'package:e_commerce/helper/hexColor.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String? name;
  Color? color;
  String? image;
  String? size;
  String? description;
  String price = "";
  String? productId;

  ProductModel(
      {this.name,
      this.color,
      this.image,
      this.size,
      this.description,
     required this.price,
      this.productId});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    color = HexColor.fromHex(map['color']);
    image = map['image'];
    size = map['size'];
    description = map['description'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'color': color,
      'image': image,
      'size': size,
      'description': description,
      'price': price,
      'productId': productId,
    };
  }
}
