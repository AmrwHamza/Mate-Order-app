import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/theme_service.dart';

AppBar appBarStyle(String title) {
  return AppBar(
    backgroundColor: kPrimaryColor4,
    title: Text(
      title.tr(),
      style: const TextStyle(color: Colors.white),
    ),
  );
}

AppBar mainAppBar(String title) {
  return AppBar(
    backgroundColor: kPrimaryColor4,
    centerTitle: true,
    title: Text(
      title.tr(),
      // style: const TextStyle(color: Colors.white),
    ),
    
  );
}
