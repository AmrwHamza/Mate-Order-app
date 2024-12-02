import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
    required this.validator,
    this.prefixText,
    required this.label,
    this.keyboardType,
    required this.onChanged,
  });
  final Widget label;
  final String? hintText;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? prefixText;
  final TextInputType? keyboardType;
  final void Function(String?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      height: 66,
      width: 330,
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: 15, color: Colors.black, height: 1),
        obscureText: obscureText,
        decoration: InputDecoration(
          label: label,
          suffixIcon: suffixIcon,
          prefixText: prefixText,
          prefixStyle: TextStyle(fontSize: 15, color: Colors.black, height: 1),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kPrimaryColor6)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kPrimaryColor6)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: kPrimaryColor6)),
          fillColor: kPrimaryColor10,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 15, color: Colors.black.withOpacity(0.35), height: 1),
        ),
        validator: validator,
      ),
    );
  }
}
