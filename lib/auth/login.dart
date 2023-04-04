import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interview_task/auth/google_sign_in.dart';
import 'package:interview_task/screens/homepage.dart';
import 'package:interview_task/widget/widget.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  String countryco = "";
  TextEditingController countrycode = TextEditingController();
 TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
   SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    reusableTextField(
                        "UserName", Icons.person, false, _userNameTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(
                        "Email Id", Icons.person, false, _emailTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    reusableTextField(" password", Icons.lock_open_outlined,
                        false, _passwordTextController),
                    const SizedBox(
                      height: 20,
                    ),
                    signInSignupButton(context, false, () {
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: _emailTextController.text,
                              password: _passwordTextController.text)
                          .then((value) {
                        ElevatedButton.styleFrom(
                            primary: Colors.black26,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  LoggedinWidget()));
      
                        print(
                            "hellooooooooooooooooooooooooooooooooooooooooooooooooooooooooo");
                      }).onError((error, stackTrace) {
                        print("printjjjjjjjjjjj${error.toString()}");
                      });
                    }),
                 
                
                  ],
                ),
              ),
            ),
           
            
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(28, 116, 187, 1),
                  onPrimary: Color.fromARGB(255, 83, 65, 65),
                  minimumSize:const Size(double.infinity, 50),
                ),
                  onPressed: ()async {
                    final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                     await provider.googleLogin().then((value) {
                           Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoggedinWidget()));
                          final text = "success with name and email";
                          final snackbar = SnackBar(content: Text(text));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                     });
                  },
                  icon: const FaIcon(FontAwesomeIcons.google),
                   label: const Text("Sign Up with Google",style: TextStyle(color: Colors.black),)),
              const SizedBox(
                height: 40,
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
