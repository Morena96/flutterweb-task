import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalStorage {
  SharedPreferences? prefs;

  Future<String> getString(String key) async {
    prefs ??= await SharedPreferences.getInstance();
    return prefs!.getString(key) ?? '';
  }

  Future<void> setString(String key, String value) async {
    prefs ??= await SharedPreferences.getInstance();
    await prefs!.setString(key, value);
  }
}
