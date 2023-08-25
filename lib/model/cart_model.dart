class CartModel{
  String? name;
  String? price;
  String? image;

  CartModel({this.name, this.price, this.image});

  CartModel.fromJson(Map<dynamic,dynamic> map){
  if (map == null) {
  return;
  }
  name = map['name'];
  price = map['price'];
  image = map['image'];
}

toJson(){
    return{
      'name' : name,
      'price' : price,
      'image' : image,
    };
}
}