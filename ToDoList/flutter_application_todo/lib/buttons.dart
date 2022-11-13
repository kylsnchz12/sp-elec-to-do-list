import 'package:flutter/material.dart';

class buttons extends StatelessWidget {
  buttons({super.key, required this.text, required this.onPressed});
  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.greenAccent[100],
      child: Text(text),
    );
  }
}
