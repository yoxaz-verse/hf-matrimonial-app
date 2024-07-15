import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManagerUtils {
  static String isLogin = "is_login";
  static String viewsRemaining = "views_remaining";
  static String requestsRemaining = "requests_remaining";
  static String isProfileComplete = "is_profile_complete";
  static String isSubscribed = "is_subscribed";
  static String isPhoneVerified = "is_phone_verified";
  static String isEmailVerified = "is_email_verified";
  static String isProfileVerified = "is_profile_verified";
  static String token = "Token";
  static String profName = "ProfName";
  static String profEmail = "ProfEmail";
  static String profMobileNo = "ProfMobileNo";
  static String userId = "userId";
  static String profileId = "profileId";
  static String accountId = "accountId";
  static String userName = "UserName";

  ///setIsLogin
  static Future setIsLogin(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLogin, value);
  }

  static Future<bool> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? false;
  }
  ///setisProfileComplete
  static Future setIsProfileComplete(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isProfileComplete, value);
  }

  static Future<bool> getIsProfileComplete() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isProfileComplete) ?? false;
  }


  ///setisPhoneVerified
  static Future setIsPhoneVerified(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isPhoneVerified, value);
  }

  static Future<bool> getIsPhoneVerified() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isPhoneVerified) ?? false;
  }


  ///setisEmailVerified
  static Future setIsEmailVerified(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isEmailVerified, value);
  }

  static Future<bool> getIsEmailVerified() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isEmailVerified) ?? false;
  }


 ///setisProfileVerified
  static Future setIsProfileVerified(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isProfileVerified, value);
  }

  static Future<bool?> getIsProfileVerified() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isProfileVerified);
  }



  ///setToken
  static Future setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, value);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(token) ?? '';
  }

  ///setviewsRemaining
  static Future setViewsRemaining(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(viewsRemaining, value);
  }

  static Future<int> getViewsRemaining() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(viewsRemaining) ?? 0;
  }
  ///setviewsRemaining
  static Future setRequestsRemaining(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(requestsRemaining, value);
  }

  static Future<int> getRequestsRemaining() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(requestsRemaining) ?? 0;
  }

  ///setProfName
  static Future setProfName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(profName, value);
  }

  static Future<String> getProfName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(profName).toString() ?? '';
  }

  ///setProfEmail
  static Future setProfEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(profEmail, value);
  }

  static Future<String> getProfEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(profEmail).toString() ?? '';
  }

  ///setIsSubscribed
  static Future setIsSubscribed(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isSubscribed, value);
  }

  static Future<bool> getIsSubscribed() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isSubscribed) ?? false;
  }

  ///setProfMobileNo
  static Future setProfMobileNo(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(profMobileNo, value);
  }

  static Future<String> getProfMobileNo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(profMobileNo).toString() ?? '';
  }

  ///setUserId
  static Future setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userId, value);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userId).toString() ?? '';
  }

  ///setUserId
  static Future setProfileId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(profileId, value);
  }

  static Future<String> getProfileId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(profileId).toString() ?? 'Not Found';
  }

  ///setAccountId
  static Future setAccountId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(accountId, value);
  }

  static Future<String> getAccountId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(accountId).toString() ?? '';
  }

  /// setUserName
  static Future setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userName, value);
  }

  static Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userName).toString() ?? '';
  }

  static Future clearPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setIsLogin(false);
    setIsEmailVerified(false);
    setIsPhoneVerified(false);
    setIsProfileComplete(false);
    setIsSubscribed(false);
    setUserId("");
    setViewsRemaining(0);
    setRequestsRemaining(0);
    setUserName("");
    setToken("");
    setProfEmail('');
    setProfMobileNo('');
    setProfName('');

    prefs.clear();
  }
}
