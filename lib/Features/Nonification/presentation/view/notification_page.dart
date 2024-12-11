

import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/utils/assets.dart';

import '../../../main home/widget/app_bar_style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: MainAppBar('Notification'),
      //اذا كان ليس هناك اي اشعار سوف يعرض هذا العامود
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(60),
            child: Opacity(
                opacity: 0.6, child: Image.asset(AssetsData.noNotification)),
          ),
        ],
      ),
    );
  }
}
