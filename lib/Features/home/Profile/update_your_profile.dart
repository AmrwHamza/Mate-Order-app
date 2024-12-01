import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/home/Profile/widget/align_of_comments.dart';
import 'package:mate_order_app/Features/home/Profile/widget/check_botton.dart';
import 'package:mate_order_app/Features/home/Profile/widget/password_field_frame.dart';
import 'package:mate_order_app/constants.dart';

class UpdateYourProfile extends StatefulWidget {
  const UpdateYourProfile({super.key});

  @override
  State<UpdateYourProfile> createState() => _UpdateYourProfileState();
}

class _UpdateYourProfileState extends State<UpdateYourProfile> {
 
  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();



  String? oldPassword;

  String? newPassword;

  String? newPasswordAgain;

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
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 25, bottom: 14),
          child: ListView(
            children: [
              AlignOfComments(comment: 'Enter your current password.'),
              SizedBox(height: 5),
              PasswordFieldFrame(
                label: 'Current Password',
                controller: currentPasswordController,
              ),
              SizedBox(height: 30),
              AlignOfComments(comment: 'Enter Tour new password.'),
              SizedBox(height: 5),
              PasswordFieldFrame(
                label: 'New Password',
                controller: newPasswordController,
              ),
              SizedBox(height: 30),
              AlignOfComments(comment: 'Confirm your new password.'),
              SizedBox(height: 5),
              PasswordFieldFrame(
                label: 'Confirm Your Password',
                controller: confirmPasswordController,
              ),
              SizedBox(height: 40),
              IconButton(
                onPressed: () {
                  oldPassword = currentPasswordController.text;
                  newPassword = newPasswordController.text;
                  newPasswordAgain = confirmPasswordController.text;
               
                },
                icon: CheckBotton(),
              ),
            ],
          ),
        ));
  }
}










