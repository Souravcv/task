import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';

class LoggedinWidget extends StatelessWidget {
  const LoggedinWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final formKey = GlobalKey<FormState>();
   

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //name
                TextFormField(
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "name",
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 114, 128, 128)
                            .withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor:
                        const Color.fromARGB(255, 26, 190, 114).withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Enter Correct name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
          
                //Email
                TextFormField(
                 
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 114, 128, 128)
                            .withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor:
                        const Color.fromARGB(255, 26, 190, 114).withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                   validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
                      return "Enter Correct email";
                    } else {
                      return null;
                    }
                  },
                ),
          
                SizedBox(
                  height: 10,
                ),
                //phone
          
                TextFormField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: " Phone",
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 114, 128, 128)
                            .withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor:
                        const Color.fromARGB(255, 26, 190, 114).withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty 
                            ) {
                      return "Enter Correct phone Number";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 10,
                ),
          
                //Password
                TextFormField(
                  
                  obscureText: true,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_outlined),
                    labelText: " Password",
                    labelStyle: TextStyle(
                        color: const Color.fromARGB(255, 114, 128, 128)
                            .withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor:
                        const Color.fromARGB(255, 26, 190, 114).withOpacity(0.3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
          ElevatedButton(onPressed: (){
            if (formKey.currentState!.validate()) {
              final snackbar = SnackBar(content: Text("okkkkkk"));
              print("jsdvfjsvfjsvjdv,jhfb fdv d");
            }
          },
           child:const Text("click"))
            
              ],
            ),
          ),
        )));
  }
}
