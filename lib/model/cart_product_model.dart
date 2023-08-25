class CartProductModel {
  String? name;
  String? image;
  String price = "";
  String? productId;
  int quantity = 0;

  CartProductModel(
      {this.name, this.image, required this.price , required this.quantity, this.productId});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    price = map['price'];
    quantity = map['quantity'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
