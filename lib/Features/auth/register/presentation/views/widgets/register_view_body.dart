import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_register_button.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/custom_text_form_field.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/logo.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/widgets/register_text.dart';

import 'package:mate_order_app/constants.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});

  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Logo(),
            RegisterOrLogInText(
              data: 'Register',
            ),
            Divider(
              color: kPrimaryColor1,
              indent: 27,
              endIndent: 27,
            ),
            CustomTextFormField(
              label:
                  Text('First Name', style: TextStyle(color: Colors.blueGrey)),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                }
                return null;
              },
              suffixIcon: Icon(Icons.account_circle_outlined),
            ),
            CustomTextFormField(
              label:
                  Text('Last Name', style: TextStyle(color: Colors.blueGrey)),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                }
                return null;
              },
              suffixIcon: Icon(Icons.account_circle_outlined),
            ),
            CustomTextFormField(
              label: Text(
                'Phone Number',
                style: TextStyle(color: Colors.blueGrey),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                } else if (!value.startsWith('9') || value.length != 9) {
                  return "wrong number it must be like 9xxxxxxxx";
                }
                return null;
              },
              prefixText: '+963',
              hintText: '9xxxxxxxx',
              suffixIcon: Icon(Icons.phone_android_outlined),
              keyboardType: TextInputType.number,
            ),
            CustomTextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                } else if (!value.endsWith('@gmail.com')) {
                  return "It must end with @gmail.com";
                }
                return null;
              },
              suffixIcon: Icon(Icons.email_outlined),
              label: Text('Email', style: TextStyle(color: Colors.blueGrey)),
            ),
            CustomTextFormField(
              label: Text('Password', style: TextStyle(color: Colors.blueGrey)),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                } else if (value.length < 8) {
                  return "at least 8 characters";
                }
                return null;
              },
              suffixIcon: Icon(Icons.lock_outlined),
              obscureText: true,
            ),
            CustomTextFormField(
              label: Text('Confirm Password',
                  style: TextStyle(color: Colors.blueGrey)),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Required field";
                } else if (value.length < 8) {
                  return "at least 8 characters";
                }
                return null;
              },
              suffixIcon: Icon(Icons.lock_outlined),
              obscureText: true,
            ),
            SizedBox(
              height: 8,
            ),
            CustomRegisterButton(
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  print('==================');
                  print('done');
                  print('==================');
                }
              },
              data: 'Send verification code',
            ),
          ],
        ),
      ),
    );
  }
}
