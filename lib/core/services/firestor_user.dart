import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';

class FireStorUser {
  final CollectionReference _usersCollectionRef =
      FirebaseFirestore.instance.collection("Users");

  Future<void> addUserToFireStor(UserModel userModel) async {
    return await _usersCollectionRef
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser (String uid) async{
    return await _usersCollectionRef.doc(uid).get();
  }
}
