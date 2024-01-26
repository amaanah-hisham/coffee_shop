import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(30)
            ),
            contentPadding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
            fillColor: Colors.brown.shade50,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.brown[400])),
      ),
    );
  }
}