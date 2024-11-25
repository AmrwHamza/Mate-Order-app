import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class RegisterText extends StatelessWidget {
  const RegisterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        children: [
          Text(
            'Register',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor1),
          ),
        ],
      ),
    );
  }
}
