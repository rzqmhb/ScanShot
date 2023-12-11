import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const TextFieldWidget({required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: TextField(
        controller: controller,
        style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 198, 11), width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(
                color: Color.fromARGB(255, 255, 198, 11), width: 2.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
