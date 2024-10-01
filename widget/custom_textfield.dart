import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  CustomTextField({
    required this.hintText,
    required this.controller,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
