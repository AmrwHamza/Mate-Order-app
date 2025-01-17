import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../main home/widget/app_bar_style.dart';
import 'widget/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: KBackgroundColor,
      appBar: mainAppBar('Home'),
      body: const HomePageBody(),
    );
  }
}
