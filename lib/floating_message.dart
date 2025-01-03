import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

class FloatingMessage {
  BuildContext context;
  String message;
  int stateNumber; //1 for success , 2 for loading , 3 for failure , 4 wrong
  FloatingMessage(this.message, this.stateNumber, this.context) {
    floatingMessage();
  }

  void floatingMessage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      switch (stateNumber) {
        case 1:
          Flushbar(
            maxWidth: 380,
            message: message,
            messageColor: KBackgroundColor,
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            flushbarStyle: FlushbarStyle.values[0],
            icon: Icon(
              Icons.check_circle_outline_outlined,
              size: 28,
              color: Colors.green[300],
            ),
            duration: const Duration(seconds: 2),
            leftBarIndicatorColor: Colors.green[300],
            backgroundColor: kPrimaryColor1,
          ).show(context);

          break;
        case 2:
          Flushbar(
            backgroundColor: kPrimaryColor1,
            maxWidth: 380,
            message: message,
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            icon: const Icon(
              Icons.hourglass_top_rounded,
              size: 28,
              color: Colors.grey,
            ),
            duration: const Duration(seconds: 3),
            leftBarIndicatorColor: Colors.grey,
          ).show(context);

          break;

        case 3:
          Flushbar(
            backgroundColor: const Color.fromARGB(255, 0, 38, 40),
            maxWidth: 380,
            message: message,
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            icon: const Icon(
              Icons.report_gmailerrorred,
              size: 28,
              color: Colors.red,
            ),
            duration: const Duration(seconds: 3),
            leftBarIndicatorColor: Colors.red,
          ).show(context);

          break;
        case 4:
          Flushbar(
            backgroundColor: const Color.fromARGB(255, 0, 38, 40),
            maxWidth: 380,
            message: message,
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            icon: Icon(
              Icons.error_outline,
              size: 28,
              color: Colors.blue[900],
            ),
            duration: const Duration(seconds: 2),
            leftBarIndicatorColor: Colors.blue[900],
          ).show(context);
      }
    });
  }
}
