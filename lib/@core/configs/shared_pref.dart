import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsUtil {
  static const String loggedin = 'loggedin';
  static const String theme = "theme";

  static getBool(String spKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(spKey) // bool loggedIn
        ? prefs.getBool(spKey) //true     //prefs.getBool(spKey)
        : false;
  }

  static Future<bool> putBool(String? spKey, bool? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setBool(spKey!, value!);
  }

  static Future<String?> getString(String spKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.containsKey(spKey) ? prefs.getString(spKey) : '';
  }

  static Future<bool> putString(String spKey, String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(spKey, value!);
  }

  static Future<bool> logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(loggedin);

    await prefs.remove(theme);

    return true;
  }
}
