import 'package:cloud_firestore/cloud_firestore.dart';

class CartServices {
  final CollectionReference _cartCollectionRef =
      FirebaseFirestore.instance.collection("Cart");

  Future<List<QueryDocumentSnapshot>> cartProduct() async {
    var value = await _cartCollectionRef.get();
    return value.docs;
  }
}
