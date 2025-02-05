import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/auth/register/presentation/views/register_view.dart';
import 'package:mate_order_app/Features/main%20home/home.dart';
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

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      //change latter to login
      Get.to(() => const Home(),
          transition: Transition.fade, duration: KTransitionDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Get.to(const RegisterView());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          minimumSize: const Size(double.infinity, 60),
        ),
        child: const Icon(
          FontAwesomeIcons.arrowRight,
          size: 30.0,
          color: kPrimaryColor2,
        ));
  }
}
