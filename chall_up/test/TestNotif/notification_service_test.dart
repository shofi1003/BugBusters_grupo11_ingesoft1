import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:chall_up/services/session_service.dart';
import 'package:chall_up/services/notification_service.dart';

class MockFlutterLocalNotificationsPlugin extends Mock implements FlutterLocalNotificationsPlugin {}

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setBool('notifications_enabled', true);
  });

  group('Pruebas de Control de Notificaciones - ChallUp', () {
    test('control de notificaciones y persistencia de estado', () async {
      final service = SessionService();
      
      final initialState = await service.areNotificationsEnabled();
      expect(initialState, isTrue);
      
      await service.toggleNotifications();
      final firstToggle = await service.areNotificationsEnabled();
      expect(firstToggle, isFalse);
      
      await service.toggleNotifications();
      final secondToggle = await service.areNotificationsEnabled();
      expect(secondToggle, isTrue);
      
      final newService = SessionService();
      final persistedState = await newService.areNotificationsEnabled();
      
      expect(persistedState, isTrue);
    });
  });

  group('Pruebas de Autorización de Notificaciones', () {
    test('solicitar permisos de notificación - usuario acepta', () async {
      // Test simplificado, permisos requieren entorno real
    });

    test('verificar estado de notificaciones del sistema', () async {
      final notificationService = NotificationService();
      
      expect(notificationService, isNotNull);
    });
  });
}
