import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPrefService {
  static final SharedPrefService _instance = SharedPrefService._internal();
  late SharedPreferences _sharedPreferences;

  factory SharedPrefService() {
    return _instance;
  }

  SharedPrefService._internal();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setBoolValue(String key, bool value) async {
    return _sharedPreferences.setBool(key, value);
  }

  bool getBoolValue(String key) {
    return _sharedPreferences.getBool(key) ?? false;
  }
}