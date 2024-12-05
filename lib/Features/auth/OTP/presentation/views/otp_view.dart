import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/otp_view_body.dart';
import 'package:mate_order_app/constants.dart';

class OTPView extends StatelessWidget {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor9,
      body: SafeArea(child: OTPViewBody()),
    );
  }
}
