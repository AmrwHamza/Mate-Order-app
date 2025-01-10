import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Nonification/presentation/view/notifications_view_body.dart';
import 'package:mate_order_app/constants.dart';

import '../../../main home/widget/app_bar_style.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KBackgroundColor,
      appBar: mainAppBar('Notification'),
      body: const NotificationsViewBody(),
    );
  }
}
