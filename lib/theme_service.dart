import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mate_order_app/constants.dart';

class ThemeService {
  static const Color kPrimaryDark = Color(0xff013032);
  static const Color kPrimaryLight = Color(0xffC9FEF6);
  static const Color kBackgroundLight = Color(0xffEFFEFB);
  static const Color kBackgroundDark = Color(0xff013032);

  final lightTheme = ThemeData.light().copyWith(
    // primaryColor: Colors.blueGrey.shade300,
    scaffoldBackgroundColor: kBackgroundLight, 

    primaryColor: kPrimaryLight,
    appBarTheme: const AppBarTheme(
      color: kPrimaryLight,
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black), 
      titleLarge: TextStyle(color: Colors.black),
    ),
    dividerColor: Colors.black12,
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: kPrimaryDark,
    scaffoldBackgroundColor: kBackgroundDark, 

    appBarTheme: AppBarTheme(
      color: kPrimaryDark,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), 
      bodyMedium: TextStyle(color: Colors.white), 
      titleLarge: TextStyle(color: Colors.white), 
    ),
    dividerColor: Colors.white54,
  );

  final _getStorage = GetStorage();

  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkMode) {
    _getStorage.write(_darkThemeKey, isDarkMode);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);

    saveThemeData(!isSavedDarkMode());
  }
}
