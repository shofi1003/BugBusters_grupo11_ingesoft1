import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const String _autoLoginKey = 'auto_login';
  static const String _userEmailKey = 'user_email';
  static const String _userPasswordKey = 'user_password';
  static const String _notificationsEnabledKey = 'notifications_enabled';
  static const String _userIdKey = 'user_id';
  static const String _userEmailKeySession = 'user_email_session';
  static const String _rememberMeKey = 'remember_me';
  static const String _sessionTimestampKey = 'session_timestamp';

  Future<void> saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userEmailKey, email);
    await prefs.setString(_userPasswordKey, password);
    await prefs.setBool(_autoLoginKey, true);
  }

  Future<Map<String, String?>?> getSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(_autoLoginKey) == true) {
      return {
        'email': prefs.getString(_userEmailKey),
        'password': prefs.getString(_userPasswordKey),
      };
    }
    return null;
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userPasswordKey);
    await prefs.setBool(_autoLoginKey, false);
  }

  Future<void> enableNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationsEnabledKey, true);
  }

  Future<void> disableNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_notificationsEnabledKey, false);
  }

  Future<bool> areNotificationsEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notificationsEnabledKey) ?? true;
  }

  Future<void> toggleNotifications() async {
    final currentState = await areNotificationsEnabled();
    if (currentState) {
      await disableNotifications();
    } else {
      await enableNotifications();
    }
  }

  Future<void> saveUserSession(String userId, String userEmail, bool rememberMe) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId);
    await prefs.setString(_userEmailKeySession, userEmail);
    await prefs.setBool(_rememberMeKey, rememberMe);
    await prefs.setInt(_sessionTimestampKey, DateTime.now().millisecondsSinceEpoch);
  }

  Future<Map<String, dynamic>?> getUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(_userIdKey);
    final userEmail = prefs.getString(_userEmailKeySession);
    final rememberMe = prefs.getBool(_rememberMeKey) ?? false;
    final sessionTimestamp = prefs.getInt(_sessionTimestampKey);

    if (userId == null || userEmail == null) {
      return null;
    }

    if (!rememberMe && sessionTimestamp != null) {
      final sessionAge = DateTime.now().millisecondsSinceEpoch - sessionTimestamp;
      final maxSessionAge = 30 * 24 * 60 * 60 * 1000;
      
      if (sessionAge > maxSessionAge) {
        await clearUserSession();
        return null;
      }
    }

    return {
      'userId': userId,
      'userEmail': userEmail,
      'rememberMe': rememberMe,
      'sessionTimestamp': sessionTimestamp,
    };
  }

  Future<bool> isSessionValid() async {
    final session = await getUserSession();
    return session != null;
  }

  Future<void> clearUserSession() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    await prefs.remove(_userEmailKeySession);
    await prefs.remove(_rememberMeKey);
    await prefs.remove(_sessionTimestampKey);
  }

  Future<void> updateLastAccess() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_sessionTimestampKey, DateTime.now().millisecondsSinceEpoch);
  }
}
