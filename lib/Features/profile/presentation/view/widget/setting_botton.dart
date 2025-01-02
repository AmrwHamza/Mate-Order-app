import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/setting_body.dart';
import 'package:mate_order_app/constants.dart';

class SettingBotton extends StatelessWidget {
  const SettingBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => const SettingBody(),
          duration: KTransitionDuration,
        );
      },
      child: ListTile(
        trailing: const Icon(Icons.chevron_right),
        leading: Icon(Icons.settings, color: Colors.black),
        title: Text('Setting'),
      ),
    );
  }
}
