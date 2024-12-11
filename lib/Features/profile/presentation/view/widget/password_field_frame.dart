import 'package:flutter/material.dart';

class PasswordFieldFrame extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? currentPassword;

  PasswordFieldFrame({
    super.key,
    required this.label,
    required this.controller,
    this.currentPassword,
  });
  @override
  _PasswordFieldFrameState createState() => _PasswordFieldFrameState();
}

class _PasswordFieldFrameState extends State<PasswordFieldFrame> {
  bool obscureText = true;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      onTap: () {
        widget.controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: widget.controller.value.text.length,
        );
      },
      onChanged: (value) {
        setState(() {
          //شرط من اجل معالجة حقول كلمة السر الجديدة فقط
          if (widget.label != 'Current Password') {
            if (value.length < 8) {
              errorText = 'Password must be at least 8 characters long';
            } else if (widget.label == 'Current Password' &&
                widget.currentPassword != null &&
                value != widget.currentPassword) {
              errorText = 'Current Password is incorrect';
            } else {
              errorText = null;
            }
          }
        });
      },
      decoration: InputDecoration(
        labelText: widget.label,
        errorText: errorText,
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: errorText != null ? Colors.red : Colors.grey)),
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
