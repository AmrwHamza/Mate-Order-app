import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/view/locations_body.dart';
import 'package:mate_order_app/Features/Home/map/presentation/view/map_view_set_location.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar('Your Locations'),
      body: const LocationsBody(),
      floatingActionButton: AddLocationButton(),
    );
  }
}

class AddLocationButton extends StatelessWidget {
  const AddLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: "addLocationHero", // تخصيص علامة فريدة لهذا الزر

        onPressed: () {
          try {
            Get.to(() => const MapViewSetLocation());
          } catch (e) {
            debugPrint('Error navigating to MapViewSetLocation: $e');
            Get.snackbar(
              'Navigation Error',
              'An error occurred while opening the map view.',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        });
  }
}