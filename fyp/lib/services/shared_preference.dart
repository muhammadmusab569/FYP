import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static const String _userLoggedInKey = 'USERLOGGEDINKEY';

  Future<bool> saveIsLoggedIn(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(_userLoggedInKey, isLoggedIn);
  }

  Future<bool> getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_userLoggedInKey) ?? false;
  }

  static const String _userIdKey = 'USERIDKEY';

  Future<bool> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_userIdKey, userId);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userIdKey);
  }

  static const String _userNameKey = 'USERNAMEKEY';

  Future<bool> saveUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_userNameKey, userName);
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  static const String _userEmailKey = 'USEREMAILKEY';

  Future<bool> saveUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_userEmailKey, userEmail);
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  static const String _userProfileKey = 'USERPROFILEKEY';

  Future<bool> saveUserProfile(String userProfile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_userProfileKey, userProfile);
  }

  Future<String?> getUserProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userProfileKey);
  }

  static const String _userWalletKey = 'USERWALLETKEY';

  Future<bool> saveUserWallet(String userWallet) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_userWalletKey, userWallet);
  }

  Future<String?> getUserWallet() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userWalletKey);
  }
}
