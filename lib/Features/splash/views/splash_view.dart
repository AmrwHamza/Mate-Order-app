import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/splash/views/widget/splash_view_body.dart';
import 'package:mate_order_app/constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor10,
      body: SplashViewBody(),
    );
  }
}
