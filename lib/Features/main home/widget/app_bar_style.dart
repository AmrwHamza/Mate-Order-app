

import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';

AppBar AppBarStyle(String title) {
  return AppBar(
    backgroundColor: kPrimaryColor4,
    
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
  );
}

AppBar MainAppBar(String title) {
  return AppBar(
    backgroundColor: kPrimaryColor4,
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
  );
}
