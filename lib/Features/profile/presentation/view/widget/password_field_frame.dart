import 'package:flutter/material.dart';

class PasswordFieldFrame extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function(String)? onChanged;

  final ValueNotifier<bool> obscureTextNotifier = ValueNotifier<bool>(true);

  PasswordFieldFrame(
      {super.key,
      required this.label,
      required this.controller,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextNotifier,
        builder: (context, obscureText, child) {
          return TextFormField(
            controller: controller,
            obscureText: obscureText,
            cursorColor: Colors.black,
            onTap: () {
              controller.selection = TextSelection(
                baseOffset: 0,
                extentOffset: controller.value.text.length,
              );
            },
            decoration: InputDecoration(
              labelText: label,
              border: const OutlineInputBorder(),
              prefixIcon:
                  Icon(Icons.lock, color: Colors.black.withOpacity(0.7)),
              suffixIcon: IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black.withOpacity(0.5),
                ),
                onPressed: () {
                  obscureTextNotifier.value = !obscureText;
                },
              ),
            ),
          );
        });
  }
}
