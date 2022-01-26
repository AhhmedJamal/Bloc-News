import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? preF;

  static init() async {
    preF = await SharedPreferences.getInstance();
  }

// change theme mode
  static Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    return await preF!.setBool(key, value);
  }

  static bool? getBool({
    required String key,
  }) {
    return preF!.getBool(key);
  }

  // change news country

  static Future<bool> setString({
    required String key,
    required String value,
  }) async {
    return await preF!.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
    return preF!.getString(key);
  }
}
