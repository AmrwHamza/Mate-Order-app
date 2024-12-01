import 'package:flutter/material.dart';

class TextFieldFrame extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;

  const TextFieldFrame(
      {super.key, required this.label, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.black.withOpacity(0.7),
      obscureText: true,
      onTap: () {
        controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: controller.value.text.length,
        );
      },
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          icon,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
    );
  }
}