

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class UserModel {



  final String? name;
  final String? email;
  final String? phone;
  final String? passworde;
  UserModel({required this.name,required this.email,required this.phone,required this.passworde});
  factory UserModel.fromSnapshote(DocumentSnapshot snap){
    var snapeshot = snap.data() as Map<String,dynamic>;
    return UserModel(
      name: snapeshot['name'],
      email: snapeshot['email'], 
      phone: snapeshot['phone'], 
      passworde: snapeshot['passworde'],);
  }
  Map<String,dynamic>toJson()=>{
     "name":name,
     "email":email,
     "phone":phone,
     "passworde":passworde
  };
}