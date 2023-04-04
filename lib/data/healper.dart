

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interview_task/data/user_model.dart';

class FireStorHealper {
static Stream<List<UserModel>>read(){
  final userCollection = FirebaseFirestore.instance.collection("users");
  return userCollection.snapshots().map((querySnapshote) => querySnapshote.docs.map((e) => UserModel.fromSnapshote(e)).toList());
}

 static  create(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final docRef = userCollection.doc();

   final newUser = UserModel(
    name: user.name, 
    email: user.email, 
    phone: user.phone, 
    passworde: user.passworde).toJson();
    try {
      await docRef.set(newUser);
    } catch (e) {
      print("some error occured $e");
    }
    await docRef.set(newUser);
  } 
}