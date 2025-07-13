import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebasep/pages/my_text.dart';
import 'package:login_firebasep/pages/my_textfield.dart';
import 'package:login_firebasep/pages/register_page.dart';
import 'package:login_firebasep/pages/signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signinButton() async {
  

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (!mounted) return;
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmail();
      } else if (e.code == 'wrong-password') {
        wrongPassword();
      }
    }
  }

  Future<void> wrongEmail() {
    return showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(title: Text("Wrong Email"));
      },
    );
  }

  void wrongPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(title: Text("Wrong Password"));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            //logo
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.accessibility_new, size: 100),
            ),
            SizedBox(height: 20),

            //welcome back you have been missed
            MyText(text: 'Welcome Back'),
            MyText(text: 'you were missed'),
            //username textfield
            SizedBox(height: 20),

            MyTextfield(
              textController: emailController,
              hintText: 'Email',
              obscureTextPW: false,
            ),
            //password textfield
            SizedBox(height: 8),
            MyTextfield(
              textController: passwordController,
              hintText: 'Password',
              obscureTextPW: true,
            ),
            // forgot password?
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "forgot password?",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            // sign in button
            SizedBox(height: 20),
            SigninButton(onTap: signinButton),
            // or continue witj
            SizedBox(height: 40),
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "or continue with",
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
                  icon: Icon(Icons.mail, size: 100, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.apple, size: 100, color: Colors.black),
                ),
              ],

              //google + android button
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'not a member ?',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  child: Text(
                    'Register now',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),

            // not a member? register now
          ],
        ),
      ),
    );
  }
}
