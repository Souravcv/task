

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoggedinWidget extends StatelessWidget {
  const LoggedinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title:const Text("Hello"),
        centerTitle: true,
        actions: [
          TextButton(onPressed: (){}, child:const Text('Logout'))
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("666",style: TextStyle(fontSize: 24),),
            SizedBox(height: 32,),
           CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://imgs.search.brave.com/xp38TOFN041Tckx-upE6pZVSm-BhJtNiUaEt3Ao37Yc/rs:fit:459:225:1/g:ce/aHR0cHM6Ly90c2Uy/LmV4cGxpY2l0LmJp/bmcubmV0L3RoP2lk/PU9JUC5aQXFOUlAt/cDcweHZlS1ZSSnQ1/OTVRSGFIcCZwaWQ9/QXBp"),
           )
          ],
        ),
      ),
    );
  }
}