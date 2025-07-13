import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final textController;
  final String hintText;
  final bool obscureTextPW;
  const MyTextfield({
    required this.textController,
    required this.hintText,
    required this.obscureTextPW,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        obscureText: obscureTextPW,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.grey,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
