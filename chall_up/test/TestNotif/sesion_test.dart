import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chall_up/services/session_service.dart';

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setBool('notifications_enabled', true);
  });

  group('Pruebas de Servicio de Sesión - ChallUp', () {
    test('flujo completo de auto-login y credenciales', () async {
      final service = SessionService();
      
      await service.saveCredentials('usuario@prueba.com', 'password123');
      final savedCredentials = await service.getSavedCredentials();
      
      expect(savedCredentials, isNotNull);
      expect(savedCredentials!['email'], equals('usuario@prueba.com'));
      expect(savedCredentials!['password'], equals('password123'));
      
      final newService = SessionService();
      final autoLoginCredentials = await newService.getSavedCredentials();
      
      expect(autoLoginCredentials, isNotNull);
      expect(autoLoginCredentials!['email'], equals('usuario@prueba.com'));
      expect(autoLoginCredentials!['password'], equals('password123'));
      
      await service.clearCredentials();
      final afterLogout = await service.getSavedCredentials();
      
      expect(afterLogout, isNull);
    });
  });

  group('Pruebas de Persistencia de Sesión de Usuario', () {
    test('guardar y recuperar sesión con remember_me activo', () async {
      final service = SessionService();
      
      await service.saveUserSession('user123', 'usuario@prueba.com', true);
      final session = await service.getUserSession();
      
      expect(session, isNotNull);
      expect(session!['userId'], equals('user123'));
      expect(session!['userEmail'], equals('usuario@prueba.com'));
      expect(session!['rememberMe'], isTrue);
      expect(session!['sessionTimestamp'], isNotNull);
      
      final newService = SessionService();
      final recoveredSession = await newService.getUserSession();
      
      expect(recoveredSession, isNotNull);
      expect(recoveredSession!['userId'], equals('user123'));
      expect(recoveredSession!['rememberMe'], isTrue);
    });

    test('sesión expira después de 30 días sin remember_me', () async {
      final service = SessionService();
      
      final prefs = await SharedPreferences.getInstance();
      final oldTimestamp = DateTime.now().subtract(const Duration(days: 31)).millisecondsSinceEpoch;
      
      await prefs.setString('user_id', 'user123');
      await prefs.setString('user_email_session', 'usuario@prueba.com');
      await prefs.setBool('remember_me', false);
      await prefs.setInt('session_timestamp', oldTimestamp);
      
      final session = await service.getUserSession();
      
      expect(session, isNull);
    });

    test('limpiar sesión elimina todos los datos', () async {
      final service = SessionService();
      
      await service.saveUserSession('user123', 'usuario@prueba.com', false);
      final beforeClear = await service.getUserSession();
      expect(beforeClear, isNotNull);
      
      await service.clearUserSession();
      final afterClear = await service.getUserSession();
      
      expect(afterClear, isNull);
    });

    test('actualizar timestamp de último acceso', () async {
      final service = SessionService();
      
      await service.saveUserSession('user123', 'usuario@prueba.com', false);
      final initialSession = await service.getUserSession();
      final initialTimestamp = initialSession!['sessionTimestamp'] as int;
      
      await Future.delayed(const Duration(milliseconds: 100));
      
      await service.updateLastAccess();
      final updatedSession = await service.getUserSession();
      final updatedTimestamp = updatedSession!['sessionTimestamp'] as int;
      
      expect(updatedTimestamp, greaterThan(initialTimestamp));
    });

    test('verificar validez de sesión', () async {
      final service = SessionService();
      
      await service.saveUserSession('user123', 'usuario@prueba.com', true);
      final isValid = await service.isSessionValid();
      
      expect(isValid, isTrue);
      
      await service.clearUserSession();
      final isInvalid = await service.isSessionValid();
      
      expect(isInvalid, isFalse);
    });
  });
}
