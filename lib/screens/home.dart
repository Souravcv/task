

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:interview_task/auth/login.dart';
import 'package:interview_task/screens/homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
            
          }
          else if(snapshot.hasData){
          return LoggedinWidget();
          }
          
          else if (snapshot.hasError){
            return Center(child: Text("Something is worong"),);
          }else{
            return SignUpWidget();
          }
         
        },
      )
    );
  }
}