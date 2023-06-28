import 'package:chekinapp/export.dart';

class SharedPrefs {
  static final Future<SharedPreferences> _prefInstance =
      SharedPreferences.getInstance();

  ///get instance of sharedpref
  static Future<SharedPreferences> _getInstance() async {
    SharedPreferences preferences = await _prefInstance;
    return preferences;
  }

  static Future<String> getString(String key) async {
    final SharedPreferences pref = await _getInstance();
    return pref.containsKey(key) == true ? pref.getString(key) ?? '' : '';
  }

  ///set string with key value
  static Future<String> setString(String key, String value) async {
    await (await _getInstance()).setString(key, value);
    return value;
  }

  static Future<Map<String, dynamic>> setMap(
      String key, Map<String, dynamic> value) async {
    await setString(key, json.encode(value));
    return value;
  }

  static Future<Map<String, dynamic>> getMap(key) async {
    try {
      final map = await getString(key);

      return map.isNotEmpty == true ? json.decode(map) : {};
    } catch (e) {
      return {};
    }
  }

  ///this is used to store List
  static Future<List> setStringList(String key, List<String> value) async {
    await (await _getInstance()).setStringList(key, value);
    return value;
  }

  ///this is used to get a String list
  static Future<List<Object?>?> getList(String key) async {
    var pref = await _getInstance();

    return pref.containsKey(key) == true ? pref.getStringList(key) : [];
  }

  static Future<bool> checkKey(key) async =>
      (await _getInstance()).containsKey(key);

  static Future<int?> getInt(String key) async =>
      (await _getInstance()).getInt(key);

  static Future<int> setInt(String key, int value) async {
    await (await _getInstance()).setInt(key, value);
    return value;
  }

  static Future<bool?> getBool(String key) async =>
      (await _getInstance()).getBool(key);

  static Future<bool> setBool(String key, bool value) async {
    await (await _getInstance()).setBool(key, value);
    return value;
  }

  static Future<bool> contains(String key) async =>
      (await _getInstance()).containsKey(key);

  static Future<bool> remove(String key) async =>
      (await _getInstance()).remove(key);
}
