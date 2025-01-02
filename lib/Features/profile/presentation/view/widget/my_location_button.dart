import 'package:flutter/material.dart';

class MyLocationButton extends StatelessWidget {
  const MyLocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        trailing: const Icon(Icons.chevron_right),
        leading: Icon(Icons.location_on, color: Colors.black),
        title: Text('My Locatin'),
      ),
    );
  }
}
