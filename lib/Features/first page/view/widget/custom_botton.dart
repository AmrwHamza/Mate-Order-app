import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
      Get.to(() =>  Home(),
          transition: Transition.fade, duration: KTransitionDuration);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : buttonPress, 
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor8, 
        disabledBackgroundColor:
            kPrimaryColor8, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(double.infinity, 60),
      ),
      child: isLoading
          ? SpinKitThreeBounce(
              
              color: kPrimaryColor2,
              size: 20.0,
            )
          : Icon(
              FontAwesomeIcons.arrowRight,
              size: 30.0,
              color: kPrimaryColor2,
            ),
    );
  }
}
