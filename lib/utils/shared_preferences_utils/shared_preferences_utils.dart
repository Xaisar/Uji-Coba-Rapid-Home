import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_name.dart';

class SharedPrefUtils {

  //for stored status OnBoarding
  Future<void> storedFirstTime(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(FIRSTTIME, value);
  }

  Future<bool?> getFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(FIRSTTIME);
  }

  Future<void> removeFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(FIRSTTIME);
  }

  //for stored Account(Username & Password)
  Future<void> storedAccount(String accountValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(ACCOUNT, accountValue);
  }

  Future<String?> getAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCOUNT);
  }

  Future<void> removeAccount() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(ACCOUNT);
  }

  //for stored session(Token & Expired date)
  Future<void> storedSession(String sessionValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SESSIONTOKEN, sessionValue);
  }

  Future<String?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SESSIONTOKEN);
  }

  Future<void> removeSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(SESSIONTOKEN);
  }

  //for stored session(Token & Expired date)
  Future<void> storedUser(String sessionUser) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(USER, sessionUser);
  }

  Future<String?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER);
  }

  Future<void> removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(USER);
  }
  
}