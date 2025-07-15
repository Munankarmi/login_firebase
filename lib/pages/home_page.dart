import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebasep/pages/login_page.dart';



class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // @override
  // void initState() {
  //   super.initState();
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //   // Safe to use context here
  //  Navigator.pop(context);
  // });
  // }

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
