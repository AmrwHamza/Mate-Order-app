import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/presentation/view/widget/home_page_body.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';
import 'package:mate_order_app/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: MainAppBar('Home'),
      body: const HomePageBody(),
    );
  }
}
