import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mate_order_app/Features/profile/presentation/view/widget/change_password_body.dart';
import 'package:mate_order_app/constants.dart';

class ChangePasswordBotton extends StatelessWidget {
  const ChangePasswordBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ChangePasswordBody(),
          popGesture: true,
          duration: KTransitionDuration,
        );
      },
      child: ListTile(
        trailing: const Icon(Icons.chevron_right),
        leading: Icon(FontAwesomeIcons.lock, color: Colors.black),
        title: Text('Change Passsword'),
      ),
    );
  }
}
