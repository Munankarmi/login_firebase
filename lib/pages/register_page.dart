import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebasep/pages/login_page.dart';
import 'package:login_firebasep/pages/my_text.dart';
import 'package:login_firebasep/pages/my_textfield.dart';
import 'package:login_firebasep/pages/signUp_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerMailController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerConfirmPasswordController = TextEditingController();

  void registerUser() async {
    try {
      if (registerPasswordController.text == registerConfirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: registerMailController.text,
          password: registerConfirmPasswordController.text,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage();
    }
    print("button tapped");
  }

  void showErrorMessage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40),
              Icon(Icons.accessibility_new, size: 100),
              SizedBox(height: 20),
              MyText(text: "Welcome to new journey"),
              SizedBox(height: 20),
              MyTextfield(
                textController: registerMailController,
                hintText: "Email",
                obscureTextPW: false,
              ),
              SizedBox(height: 10),
              MyTextfield(
                textController: registerPasswordController,
                hintText: "Password",
                obscureTextPW: true,
              ),
              SizedBox(height: 10),
              MyTextfield(
                textController: registerConfirmPasswordController,
                hintText: "Confirm Password",
                obscureTextPW: true,
              ),
              SizedBox(height: 20),
              SignUpButton(onTap: registerUser),
              SizedBox(height: 40),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.black)),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "or Continue with",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.black)),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.mail),
                    iconSize: 100,
                    color: Colors.black,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.apple),
                    iconSize: 100,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already a member ?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      "Login now",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
