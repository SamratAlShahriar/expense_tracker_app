import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String LOGIN = 'login';
  static const String USER_ID = 'user_id';

  static Future<bool> setloggedInStatus(bool status) async {
    final sf = await SharedPreferences.getInstance();
    return sf.setBool(LOGIN, status);
  }

  static Future<bool> getLoggedInStatus() async {
    final sf = await SharedPreferences.getInstance();
    return sf.getBool(LOGIN) ?? false;
  }

  static Future<bool> setUserId(int id) async {
    final sf = await SharedPreferences.getInstance();
    return sf.setInt(USER_ID, id);
  }

  static Future<int> getUserId() async {
    final sf = await SharedPreferences.getInstance();
    return sf.getInt(USER_ID) ?? 0;
  }


}
