import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/profile/presentation/view/my_locations/my_locations_view.dart';

class MyLocationButton extends StatelessWidget {
  const MyLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const MyLocationsView());
      },

  child: ListTile(
        trailing: const Icon(Icons.chevron_right),
        leading: const Icon(Icons.location_on, color: Colors.black),
        title: const Text('My Locations').tr(),
      ),
    );
  }
}
