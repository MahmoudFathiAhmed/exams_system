import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  static String userLoginkey = 'USERLOGGEDIN';

  static void saveUserLoginDetails(bool isLoggedin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userLoginkey, isLoggedin);
  }

  static Future<bool> getUserLoggedinDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoginkey)!;
  }

  static saveLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(userLoginkey);
  }
}
