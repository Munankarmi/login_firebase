import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebasep/pages/login_page.dart';



class HomePage extends StatelessWidget {
   HomePage({super.key});

   final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed : signOut, icon: Icon(Icons.logout))],
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(child: Text("LoggedIn Succesfuly!!! as @ " + user.email! )),
      backgroundColor: Colors.grey,
    );
  }
}
