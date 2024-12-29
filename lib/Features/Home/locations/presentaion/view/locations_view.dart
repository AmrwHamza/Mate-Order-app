import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/view/locations_body.dart';
import 'package:mate_order_app/Features/main%20home/widget/app_bar_style.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar('Your Locations'),
      body: LocationsBody(),
    );
  }
}
