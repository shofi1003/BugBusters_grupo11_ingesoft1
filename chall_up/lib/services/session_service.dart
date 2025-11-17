import 'package:shared_preferences/shared_preferences.dart';

class SessionService {
  static const String _autoLoginKey = 'auto_login';
  static const String _userEmailKey = 'user_email';
  static const String _userPasswordKey = 'user_password';
  static const String _notificationsEnabledKey = 'notifications_enabled';

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

  // Nuevos métodos para controlar notificaciones
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
    return prefs.getBool(_notificationsEnabledKey) ?? true; // Default: enabled
  }

  Future<void> toggleNotifications() async {
    final currentState = await areNotificationsEnabled();
    if (currentState) {
      await disableNotifications();
    } else {
      await enableNotifications();
    }
  }
}
