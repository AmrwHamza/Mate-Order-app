import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({super.key, required this.data});
    final String data ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 206,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Text(
          data,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }
}
