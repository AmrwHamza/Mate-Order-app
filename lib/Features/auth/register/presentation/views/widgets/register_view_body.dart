import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_text_form_field.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/logo.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/register_text.dart';

import 'package:mate_order_app/constants.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Logo(),
          RegisterOrLogInText(data: 'Register',),
          Divider(
            color: kPrimaryColor1,
            indent: 27,
            endIndent: 27,
          ),
          CustomTextFormField(
            hintText: 'First Name',
            suffixIcon: Icon(Icons.account_circle_outlined),
          ),
          CustomTextFormField(
            hintText: 'Last Name',
            suffixIcon: Icon(Icons.account_circle_outlined),
          ),
          CustomTextFormField(
            hintText: 'Phone Number',
            suffixIcon: Icon(Icons.phone_android_outlined),
          ),
          CustomTextFormField(
            hintText: 'Email',
            suffixIcon: Icon(Icons.email_outlined),
          ),
          CustomTextFormField(
            hintText: 'Password',
            suffixIcon: Icon(Icons.lock_outlined),
            obscureText: true,
          ),
          CustomTextFormField(
            hintText: 'Confirm Password',
            suffixIcon: Icon(Icons.lock_outlined),
            obscureText: true,
          ),
          SizedBox(
            height: 8,
          ),
          CustomRegisterButton(
            data: 'Send verification code',
          ),
        ],
      ),
    );
  }
}
