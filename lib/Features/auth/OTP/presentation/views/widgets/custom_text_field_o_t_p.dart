import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/controllers_otp.dart';
import 'package:mate_order_app/constants.dart';

class CustomTextFieldOTP extends StatelessWidget {
  CustomTextFieldOTP({
    required this.first,
    required this.last,
    required this.controller,
    super.key,
  });

  bool first;
  bool last;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(spreadRadius: 5, color: Colors.white, blurRadius: 20)
          ],
          border: Border.all(width: 1.5, color: kPrimaryColor6),
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor10),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if (value.isNotEmpty && last == false) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        style: const TextStyle(fontSize: 25),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).width / 8,
            maxWidth: MediaQuery.sizeOf(context).width / 8,
          ),
        ),
      ),
    );
  }
}
