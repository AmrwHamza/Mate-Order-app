import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class CustomRegisterButton extends StatelessWidget {
  const CustomRegisterButton({super.key, required this.data, this.onPressed});
  final String data;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 206,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 5,
            backgroundColor: kPrimaryColor7,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        child: Text(
          data,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }
}
