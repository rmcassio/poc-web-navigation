import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  static SharedPreferences? _prefsInstance;
  static Future<SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String? getString(String key) {
    return _prefsInstance!.getString(key) ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    SharedPreferences prefs = await _instance;
    return prefs.setString(key, value);
  }

  static Future<bool> setStringList(String key, List<String> values) async {
    SharedPreferences prefs = await _instance;
    return prefs.setStringList(key, values);
  }
}
