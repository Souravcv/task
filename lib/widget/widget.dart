import 'package:flutter/material.dart';

TextFormField reusableTextField(String text, IconData icon,
    bool isPasswordeType, TextEditingController controllers) {
  return TextFormField(
    controller: controllers,
    obscureText: isPasswordeType,
    autocorrect: isPasswordeType,
    enableSuggestions: !isPasswordeType,
    cursorColor: const Color.fromARGB(255, 120, 50, 177),
    style: TextStyle(
      color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(
          color: const Color.fromARGB(255, 114, 128, 128).withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: const Color.fromARGB(255, 26, 190, 114).withOpacity(0.3),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordeType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignupButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? "LOG IN" : "SIGN UP",
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 30),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Colors.white;
        }),
      ),
    ),
  );
}
