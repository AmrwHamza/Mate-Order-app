import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

AppBar appBarStyle(String title) {
  return AppBar(
    backgroundColor: kPrimaryColor4,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
  );
}

AppBar mainAppBar(String title) {
  return AppBar(
    backgroundColor: kPrimaryColor4,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
