import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/home/Profile/widget/check_botton.dart';
import 'package:mate_order_app/Features/home/Profile/widget/editable_text_field.dart';
import 'package:mate_order_app/constants.dart';

import 'widget/align_of_comments.dart';

class EditPersonalInf extends StatefulWidget {
  const EditPersonalInf({super.key});

  @override
  State<EditPersonalInf> createState() => _EditPersonalInfState();
}

class _EditPersonalInfState extends State<EditPersonalInf> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? email;

  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Edit Your Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AlignOfComments(comment: 'Press to edit you email.  '),
            SizedBox(height: 5),
            EditableTextField(
                label: 'Email',
                icon: Icons.email,
                controller: emailController,
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 40),
            AlignOfComments(comment: 'Press to edit your phone number.'),
            SizedBox(height: 5),
            EditableTextField(
                label: 'Phone Number',
                icon: Icons.phone,
                controller: phoneController,
                keyboardType: TextInputType.phone),
            SizedBox(height: 55),
            IconButton(
              onPressed: () {
                email = emailController.toString();
                phoneNumber = phoneController.toString();
              },
              icon: CheckBotton(),
            )
          ],
        ),
      ),
    );
  }
}
