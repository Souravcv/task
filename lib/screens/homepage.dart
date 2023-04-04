import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:email_validator/email_validator.dart';
import 'package:interview_task/data/healper.dart';
import 'package:interview_task/data/user_model.dart';

class LoggedinWidget extends StatefulWidget {
  LoggedinWidget({super.key});

  @override
  State<LoggedinWidget> createState() => _LoggedinWidgetState();
}

class _LoggedinWidgetState extends State<LoggedinWidget> {
  TextEditingController namecontroller = TextEditingController();

  TextEditingController emailcontroller = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController passwordecontroller = TextEditingController();
  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
    passwordecontroller.dispose();

    super.dispose();
  }

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
        body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //name
                  TextFormField(
                    controller: namecontroller,
                    style: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: "name",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 114, 128, 128)
                              .withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: const Color.fromARGB(255, 26, 190, 114)
                          .withOpacity(0.3),
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
                    controller: emailcontroller,
                    style: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_rounded),
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 114, 128, 128)
                              .withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: const Color.fromARGB(255, 26, 190, 114)
                          .withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              .hasMatch(value)) {
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
                    controller: phonecontroller,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      labelText: " Phone",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 114, 128, 128)
                              .withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: const Color.fromARGB(255, 26, 190, 114)
                          .withOpacity(0.3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
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
                    controller: passwordecontroller,
                    obscureText: true,
                    style: TextStyle(
                      color:
                          const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password_outlined),
                      labelText: " Password",
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 114, 128, 128)
                              .withOpacity(0.9)),
                      filled: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      fillColor: const Color.fromARGB(255, 26, 190, 114)
                          .withOpacity(0.3),
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
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final snackbar = SnackBar(content: Text("okkkkkk"));
                          print("jsdvfjsvfjsvjdv,jhfb fdv d");
                          create();
                          final user = UserModel(
                              name: namecontroller.text,
                              email: emailcontroller.text,
                              phone: phonecontroller.text,
                              passworde: passwordecontroller.text);
                        
                        }
                      },
                      child: const Text("click")),
                    const  SizedBox(height: 5,),
                     StreamBuilder<List<UserModel>>(
                      stream: FireStorHealper.read(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Somethink is error"),
                          );
                        }
                        if (snapshot.hasData) {
                          final userdata = snapshot.data;
                          return Expanded(
                              child: ListView.builder(
                                  itemCount: userdata!.length,
                                  itemBuilder: ((context, index) {
                                    final singleUser = userdata[index];
                                    Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: ListTile(
                                          trailing: Text("${singleUser.name}"),
                                          subtitle: Text("${singleUser.email}"),

                                        ));
                                  })));
                        }

                        return Center(child: CircularProgressIndicator(),);
                      })
                     
                ],
              ),
            ),
          )),
        ));
  }

  create() async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final docRef = userCollection.doc('users');

    await docRef.set({
    "name": namecontroller.text,
    "email": emailcontroller.text,
    "phone": phonecontroller.text,
    "Password":passwordecontroller.text,
    });
  }
}
