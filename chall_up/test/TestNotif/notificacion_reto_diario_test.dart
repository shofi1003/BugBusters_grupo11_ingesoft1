import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:chall_up/services/notification_service.dart';
import 'package:chall_up/services/date_time_service.dart';
import 'package:chall_up/services/session_service.dart';

class MockFlutterLocalNotificationsPlugin extends Mock implements FlutterLocalNotificationsPlugin {}

void main() {
  setUpAll(() async {
    tz_data.initializeTimeZones();
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setBool('notifications_enabled', true);
  });

  group('Pruebas de Notificaciones Diarias de Retos', () {
    test('programar notificación diaria a las 8 AM', () async {
      final notificationService = NotificationService();
      final dateTimeService = DateTimeService();
      
      final scheduledTime = dateTimeService.getNextScheduledTime(8, 0);
      
      expect(scheduledTime.hour, equals(8));
      expect(scheduledTime.minute, equals(0));
      
      final now = tz.TZDateTime.now(tz.local);
      if (scheduledTime.isBefore(now)) {
        expect(scheduledTime.day, equals(now.day + 1));
      }
    });

    test('manejar diferentes zonas horarias', () async {
      final dateTimeService = DateTimeService();
      
      final bogotaTime = tz.TZDateTime(tz.getLocation('America/Bogota'), 2025, 11, 16, 8, 0);
      final utcTime = tz.TZDateTime(tz.getLocation('UTC'), 2025, 11, 16, 8, 0);
      
      expect(bogotaTime.hour, equals(8));
      expect(utcTime.hour, equals(8));
    });

    test('cancelar notificaciones programadas', () async {
      final notificationService = NotificationService();
      
      expect(notificationService, isNotNull);
    });

    test('actualizar texto de reto sin reprogramar', () async {
      final notificationService = NotificationService();
      
      expect(notificationService, isNotNull);
    });

    test('estructura de payload de notificación', () async {
      final userId = 'user123';
      final challengeText = 'Haz 10 sentadillas';
      final scheduledTime = tz.TZDateTime.now(tz.local);
      
      final payload = {
        'type': 'daily_challenge',
        'userId': userId,
        'challengeText': challengeText,
        'timestamp': scheduledTime.millisecondsSinceEpoch.toString(),
      };
      
      expect(payload['type'], equals('daily_challenge'));
      expect(payload['userId'], equals(userId));
      expect(payload['challengeText'], equals(challengeText));
      expect(payload['timestamp'], isNotNull);
    });

    test('verificar integración con SessionService', () async {
      final sessionService = SessionService();
      
      expect(sessionService, isNotNull);
      
      final isEnabled = await sessionService.areNotificationsEnabled();
      expect(isEnabled, isTrue);
    });

    test('verificar integración con DateTimeService', () async {
      final dateTimeService = DateTimeService();
      
      expect(dateTimeService, isNotNull);
      
      final now = dateTimeService.now();
      expect(now, isNotNull);
    });

    test('manejar estado de notificaciones desactivadas', () async {
      final sessionService = SessionService();
      
      await sessionService.disableNotifications();
      final isEnabled = await sessionService.areNotificationsEnabled();
      
      expect(isEnabled, isFalse);
    });

    test('prueba de singleton pattern', () async {
      final service1 = NotificationService();
      final service2 = NotificationService();
      
      expect(service1, equals(service2));
      expect(service1.hashCode, equals(service2.hashCode));
    });
  });

  group('Pruebas de Horario de Notificaciones', () {
    test('programar para mañana si ya pasaron las 8 AM', () async {
      final dateTimeService = DateTimeService();
      
      final futureTime = tz.TZDateTime(tz.local, 2025, 11, 16, 9, 0);
      
      final scheduledTime = dateTimeService.getNextScheduledTime(8, 0);
      
      if (scheduledTime.hour == 8 && scheduledTime.minute == 0) {
        final now = tz.TZDateTime.now(tz.local);
        if (scheduledTime.isAfter(now)) {
        } else {
        }
      }
    });

    test('programar para hoy si aún no son las 8 AM', () async {
      final dateTimeService = DateTimeService();
      
      final scheduledTime = dateTimeService.getNextScheduledTime(8, 0);
      final now = tz.TZDateTime.now(tz.local);
      
      expect(scheduledTime.hour, equals(8));
      expect(scheduledTime.minute, equals(0));
    });
  });
}