import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/controllers_otp.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/widgets/custom_text_field_o_t_p.dart';

class OTPRowFields extends StatelessWidget {
  const OTPRowFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomTextFieldOTP(
            first: true,
            last: false,
            controller: c1,
          ),
          CustomTextFieldOTP(
            first: false,
            last: false,
            controller: c2,
          ),
          CustomTextFieldOTP(
            first: false,
            last: false,
            controller: c3,
          ),
          CustomTextFieldOTP(
            first: false,
            last: false,
            controller: c4,
          ),
          CustomTextFieldOTP(
            first: false,
            last: false,
            controller: c5,
          ),
          CustomTextFieldOTP(
            first: false,
            last: true,
            controller: c6,
          ),
        ],
      ),
    );
  }
}
