import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/cancel_button.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/align_of_comments.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/check_botton.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/password_field_frame.dart';
import 'package:mate_order_app/constants.dart';

import '../../../../main home/widget/app_bar_style.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
        appBar: AppBarStyle('Edit Your Profile'),
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
                //كلمة السر من الباك
                currentPassword: '11112222',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CancelButton(),
                  IconButton(
                    onPressed: () {
                      validatePassword();
                    },
                    icon: CheckBotton(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void validatePassword() {
    setState(() {
      oldPassword = currentPasswordController.text;
      newPassword = newPasswordController.text;
      newPasswordAgain = confirmPasswordController.text;

      if (newPassword != newPasswordAgain) {
        showAlertDialog(
            context, 'New passwords do not match', Icons.cancel, Colors.red);
      } else {
        if (oldPassword != '11112222') {
          currentPasswordController.clear();
          showAlertDialog(context, 'Current password is incorrect',
              Icons.cancel, Colors.red);
        } else {
          showAlertDialog(context, 'Password changed successfully', Icons.done,
              Colors.green);
        }
      }
    });
  }

  void showAlertDialog(
      BuildContext context, String message, IconData icon, Color color) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: KBackgroundColor,
          content: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 40,
              ),
              SizedBox(width: 10),
              Expanded(child: Text(message)),
            ],
          ),
          actions: [
            Center(
              child: TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
