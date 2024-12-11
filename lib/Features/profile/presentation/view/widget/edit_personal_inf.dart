import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/cancel_button.dart';
import '../../../../main home/widget/app_bar_style.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/align_of_comments.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/check_botton.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/editable_text_field.dart';
import 'package:mate_order_app/constants.dart';

class EditPersonalInf extends StatefulWidget {
  const EditPersonalInf({super.key});

  @override
  State<EditPersonalInf> createState() => _EditPersonalInfState();
}

class _EditPersonalInfState extends State<EditPersonalInf> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController LastNameController = TextEditingController();

  String? email;

  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: KBackgroundColor,
        appBar: AppBarStyle('Edit Your Profile'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              AlignOfComments(comment: 'Press to edit your name'),
              SizedBox(height: 10),
              EditableTextField(
                  currentName: 'Tarek',
                  label: 'First Name',
                  icon: Icons.account_circle_outlined,
                  controller: firstNameController,
                  keyboardType: TextInputType.text),
              SizedBox(height: 15),
              EditableTextField(
                  currentName: 'Alasfour',
                  label: 'Last Name',
                  icon: Icons.account_circle_outlined,
                  controller: LastNameController,
                  keyboardType: TextInputType.text),
              SizedBox(height: 30),
              AlignOfComments(comment: 'Press to edit you email.  '),
              SizedBox(height: 10),
              EditableTextField(
                  currentName: 'tarekalasfour@gmail.com',
                  label: 'Email',
                  icon: Icons.email,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 30),
              AlignOfComments(comment: 'Press to edit your phone number.'),
              SizedBox(height: 10),
              EditableTextField(
                  currentName: '0982387758',
                  label: 'Phone Number',
                  icon: Icons.phone,
                  controller: phoneController,
                  keyboardType: TextInputType.phone),
              SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CancelButton(),
                  IconButton(
                    onPressed: () {
                      email = emailController.text;
                      phoneNumber = phoneController.text;
                    },
                    icon: CheckBotton(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
