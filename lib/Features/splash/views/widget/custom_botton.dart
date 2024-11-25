import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mate_order_app/constants.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

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
