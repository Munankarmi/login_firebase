import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_firebasep/pages/auth_page.dart';
import 'package:login_firebasep/pages/register_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AuthPage());
  }
}
