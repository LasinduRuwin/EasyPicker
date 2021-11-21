import 'package:shared_preferences/shared_preferences.dart';

class Sharedpref {
  static SharedPreferences _preferences;

// initializer
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
// Email setters and getters
  static Future setEmail(String email) async =>
      await _preferences.setString('email', email);

  static String getEmail() => _preferences.getString('email');

  static Future removeEmail() => _preferences.remove('email');

  //Logged in stats setters and getters
  static Future setIsLoggedIn(bool isLoggedIn) async =>
      await _preferences.setBool('isLoggedIn', isLoggedIn);

  static bool getIsLoggedIn() => _preferences.getBool('isLoggedIn');

  static Future removeIsLoggedIn() => _preferences.remove('isLoggedIn');

  //User ID getters and Setters
  static Future setUserID(String userID) async =>
      await _preferences.setString('userID', userID);

  static String getUserID() => _preferences.getString('userID');

  static Future removeUserID() => _preferences.remove('userID');

  //User Name Setters and Getters
  static Future setUserName(String name) async =>
      await _preferences.setString('name', name);

  static String getUserName() => _preferences.getString('name');

  static Future removeUserName() => _preferences.remove('name');

  //Store Name Setters and Getters
  static Future setStoreName(String name) async =>
      await _preferences.setString('storename', name);

  static String getStoreName() => _preferences.getString('storename');

  static Future removeStoreName() => _preferences.remove('storename');
}
