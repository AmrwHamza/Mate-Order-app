import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/auth/login/presentation/views/widgets/login_view_body.dart';
import 'package:mate_order_app/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor9,
      body: SafeArea(
          child: GestureDetector(
              onTap: () {
                // FocusScope.of(context).unfocus();
              },
              child: LoginViewBody())),
    );
  }
}
