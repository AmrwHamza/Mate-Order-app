import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as tansition;
import 'package:mate_order_app/Features/auth/register/presentation/views/register_view.dart';
import 'package:mate_order_app/constants.dart';

class CountDownTimerOTP extends StatelessWidget {
  const CountDownTimerOTP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: kPrimaryColor7,
          boxShadow: const [
            BoxShadow(spreadRadius: 5, color: Colors.white, blurRadius: 20)
          ],
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: kPrimaryColor10,
          )),
      child: TimerCountdown(
        format: CountDownTimerFormat.minutesSeconds,
        endTime: DateTime.now().add(
          const Duration(minutes: 5),
        ),
        onEnd: () {
          Get.off(const RegisterView(),
              transition: tansition.Transition.leftToRight);
        },
      ),
    );
  }
}
