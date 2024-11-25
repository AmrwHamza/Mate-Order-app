import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mate_order_app/Features/register/presentation/views/widgets/custom_text_form_field.dart';
import 'package:mate_order_app/Features/register/presentation/views/widgets/logo.dart';
import 'package:mate_order_app/Features/register/presentation/views/widgets/register_text.dart';
import 'package:mate_order_app/constants.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18,
        ),
        Logo(),
        RegisterText(),
        Divider(color: kPrimaryColor1, indent: 27, endIndent: 27),
        CustomTextFormField(
          hintText: 'First name',
          suffixIcon: Icon(Icons.account_circle_outlined),
        ),
      ],
    );
  }
}
