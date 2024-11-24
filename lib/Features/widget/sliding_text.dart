
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context,_) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            'MATE ORDER',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kPrimaryColor2,
                fontSize: 30),
          ),
        );
      }
    );
  }
}
