import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  // **تعديل 1:** تحسين استخدام FlutterSecureStorage من خلال إضافة الخيارات المخصصة للأمان.
  static const flutterSecureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true, // تفعيل التشفير على أندرويد
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock, // تخصيص الوصول على iOS
    ),
  );

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    try {
      debugPrint('========SharedPrefHelper : data with key : $key has been removed=========');
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.remove(key);
    } on Exception catch (e) {
      debugPrint('===========Error while removing data:======== $e');
    }
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    try {
      debugPrint('SharedPrefHelper : all data has been cleared');
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.clear();
    } on Exception catch (e) {
      debugPrint(
          '===========Error while clearing all data: $e==================');
    }
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      debugPrint(
          "SharedPrefHelper : setData with key : $key and value : $value");
      switch (value.runtimeType) {
        case String:
          await sharedPreferences.setString(key, value);
          break;
        case int:
          await sharedPreferences.setInt(key, value);
          break;
        case bool:
          await sharedPreferences.setBool(key, value);
          break;
        case double:
          await sharedPreferences.setDouble(key, value);
          break;
        default:
          return throw Exception(
              "==||==Unsupported value type:==||== ${value.runtimeType}");
      }
    } on Exception catch (e) {
      debugPrint('=================Error while setting data:======= $e');
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) async {
    try {
      debugPrint('SharedPrefHelper : getString with key : $key');
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      return sharedPreferences.getString(key) ?? '';
    } on Exception catch (e) {
      debugPrint('=================Error while get string:======= $e');
    }
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    final flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        '=========FlutterSecureStorage: getSecuredString with key:============ $key');
    String? value = await flutterSecureStorage.read(key: key);
    debugPrint(
        '===============Stored ||value|| for key =============="$key": ||$value||');

    return value;
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}
