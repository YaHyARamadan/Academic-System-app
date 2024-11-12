import 'package:shared_preferences/shared_preferences.dart';
import '../enums/share_prefs_key.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static putString({required SharedKey key, required String value}) async {
    await sharedPreferences!.setString(key.name, value);
  }

  static getString({required SharedKey key}) {
    return sharedPreferences!.getString(key.name) ?? "";
  }

  static putBool({required SharedKey key, required bool value}) async {
    await sharedPreferences!.setBool(key.name, value);
  }

  static getBool({required SharedKey key}) {
    return sharedPreferences!.getBool(key.name) ?? false;
  }

  static putDouble({required SharedKey key, required double value}) async {
    await sharedPreferences!.setDouble(key.name, value);
  }

  static getDouble({required SharedKey key}) {
    return sharedPreferences!.getDouble(key.name) ?? 0.0;
  }

  static putInt({required SharedKey key, required int value}) async {
    await sharedPreferences!.setInt(key.name, value);
  }

  static getInt({required SharedKey key}) {
    return sharedPreferences!.getInt(key.name) ?? 0;
  }

  static delete({required SharedKey key}) {
    return sharedPreferences!.remove(key.name);
  }

  static deleteDb() {
    sharedPreferences!.clear();
  }
}

