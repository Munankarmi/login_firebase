import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebasep/pages/home_page.dart';
import 'package:login_firebasep/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle error state
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          // Check if user is authenticated
          if (snapshot.hasData && snapshot.data != null) {
            return HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
