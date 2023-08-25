
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  addData() async {
  CollectionReference collectionReference = FirebaseFirestore.instance.collection("1");
  collectionReference.add({
    "username":"salah",
    "phone":"0922203",
    "age":10
  });
  }
  @override
  void initState() {
    // TODO: implement initState
    // addData();
    addData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container());
  }
}
