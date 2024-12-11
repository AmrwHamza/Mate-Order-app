import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class CheckBotton extends StatelessWidget {
  const CheckBotton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kPrimaryColor4,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              offset: Offset(1, 1),
            )
          ]),
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}