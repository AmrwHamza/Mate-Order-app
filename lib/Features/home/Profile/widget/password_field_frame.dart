import 'package:flutter/material.dart';

class PasswordFieldFrame extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  const PasswordFieldFrame({
    super.key,
    required this.label,
    required this.controller,
  });
  @override
  _PasswordFieldFrameState createState() => _PasswordFieldFrameState();
}

class _PasswordFieldFrameState extends State<PasswordFieldFrame> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      onTap: () {
        widget.controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: widget.controller.value.text.length,
        );
      },
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(Icons.lock, color: Colors.black.withOpacity(0.7)),
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            color: Colors.black.withOpacity(0.5),
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
      ),
    );
  }
}
