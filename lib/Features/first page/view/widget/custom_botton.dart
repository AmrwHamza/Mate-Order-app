import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/views/otp_view.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/register_view.dart';
import 'package:mate_order_app/Features/home/home.dart';
import 'package:mate_order_app/constants.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool isLoading = false;

  void buttonPress() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      //change latter to login
      Get.to(() => Home(),
          transition: Transition.fade, duration: KTransitionDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.to(OTPView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: const Size(double.infinity, 60),
        ),
        child: Icon(
          FontAwesomeIcons.arrowRight,
          size: 30.0,
          color: kPrimaryColor2,
        ));
  }
}
