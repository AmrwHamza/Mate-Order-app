import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/splash/splash_view.dart';

void main() {
  runApp(const MateOrderApp());
}

class MateOrderApp extends StatelessWidget {
  const MateOrderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
