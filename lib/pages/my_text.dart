import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  const MyText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        text,
      ),
    );
  }
}
