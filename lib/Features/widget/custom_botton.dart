
import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class addButton extends StatelessWidget {
  const addButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(double.infinity, 60),
      ),
      child: Text(
        'ORDER NOW',
        style: TextStyle(
            color: kPrimaryColor2.withOpacity(.8),
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
