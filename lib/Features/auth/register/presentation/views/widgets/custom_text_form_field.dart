import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.obscureText = false,
      required this.hintText,
      this.suffixIcon});

  final String hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      height: 66,
      width: 350,
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kPrimaryColor6)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.35)),
        ),
      ),
    );
  }
}
