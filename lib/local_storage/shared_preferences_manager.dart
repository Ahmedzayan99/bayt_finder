// import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getStringAsync(String key, {String defaultValue = ''})  {
    return  sharedPreferences.getString(key) ;
  }
  static int getIntAsync(String key, {int defaultValue = 0})  {
    return sharedPreferences.getInt(key) ?? defaultValue;
  }
  static bool getBoolAsync(String key, {bool defaultValue = false})  {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }
  static double getDoubleAsync(String key, {double defaultValue = 0.0}) {
    return sharedPreferences.getDouble(key) ?? defaultValue;
  }
  static List<String>? getStringListAsync(String key) {
    return sharedPreferences.getStringList(key);
  }
  static Map<String, dynamic> getJSONAsync(String key, {Map<String, dynamic>? defaultValue}) {
    if (sharedPreferences.containsKey(key) && sharedPreferences.getString(key)!.isNotEmpty) {
      return jsonDecode(sharedPreferences.getString(key)!);
    } else {
      return defaultValue ?? {};
    }
  }
  static List<String> getMatchingSharedPrefKeys(String key) {
    List<String> keys = [];

    sharedPreferences.getKeys().forEach((element) {
      if (element.contains(key)) {
        keys.add(element);
      }
    });
    return keys;
  }

  static  Future<bool> saveData(String key, dynamic value, {bool print1 = true}) async {
    if (print1) print('${value.runtimeType} - $key - $value');
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    }
    else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }
    else if (value is Map<String, dynamic>) {
      return await sharedPreferences.setString(key, jsonEncode(value));
    }
    else if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }
    else {
      throw ArgumentError('Invalid value ${value.runtimeType} - Must be a String, int, bool, double, Map<String, dynamic> or StringList');
    }
  }
/*  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }*/

  static Future<bool> removeData(
     String key,
  ) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> clear() async {
    return await sharedPreferences.clear();
  }
}
