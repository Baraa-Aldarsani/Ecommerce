// ignore_for_file: unnecessary_overrides

import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../view/control_view.dart';
import '../services/firestor_user.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebookLogin = new FacebookLogin();
  late String email, password, name;
  Rxn<User> _user = Rxn<User>();

  String? get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
getCurrentUser(_auth.currentUser!.uid);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
      accessToken: googleAuth?.accessToken,
    );
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.to(ControView());
    });
  }

  void signInWithEmailAndPassowrd() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurrentUser(value.user!.uid);
      });
      Get.offAll(ControView());
    } catch (e) {
      Get.snackbar("Error Login account", "please check the data",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccount() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(ControView());
    } catch (e) {
      Get.snackbar("Error create account", "please check the data",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
        userId: user.user!.uid,
        email: user.user!.email,
        name: name == null ? user.user!.displayName : name,
        picture: '');
    await FireStorUser().addUserToFireStor(userModel);
    setUser(userModel);
  }

  void getCurrentUser(String uid)async{
    await FireStorUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
