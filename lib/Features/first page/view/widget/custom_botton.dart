import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        onPressed: () {
          //Navigator
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
