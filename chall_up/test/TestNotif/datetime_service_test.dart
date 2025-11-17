import 'package:flutter_test/flutter_test.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:chall_up/services/date_time_service.dart';

void main() {
  setUpAll(() async {
    tz_data.initializeTimeZones();
  });

  group('Pruebas de Servicio de Fecha y Hora - ChallUp', () {
    
    test('programación y detección de notificaciones horarias', () {
      final dateTimeService = DateTimeService();
      
      // Test 1: Verificar hora exacta de 8:00 AM para nuevo reto
      final eightAM = tz.TZDateTime(tz.local, 2025, 11, 16, 8, 0, 0);
      expect(dateTimeService.isEightAM(eightAM), isTrue);
      expect(eightAM.hour, equals(8));
      expect(eightAM.minute, equals(0));
      expect(eightAM.second, equals(0));
      
      // Test 2: Rechazar hora cercana pero no exacta
      final eightAM01 = tz.TZDateTime(tz.local, 2025, 11, 16, 8, 0, 1);
      expect(dateTimeService.isEightAM(eightAM01), isFalse);
      
      // Test 3: Programación inteligente de notificación diaria
      final currentTime = tz.TZDateTime(tz.local, 2025, 11, 16, 7, 30, 0);
      final scheduledTime = dateTimeService.getNextScheduledTime(8, 0);
      
      // Verificar que está programada para las 8:00 AM (renuevo diario de retos)
      expect(scheduledTime.hour, equals(8));
      expect(scheduledTime.minute, equals(0));
      
      // Verificar el día: podría ser hoy o mañana dependiendo de la lógica
      expect(scheduledTime.day, isIn([currentTime.day, currentTime.day + 1]));
      
      print('✓ Test: Programación horaria de notificaciones - PASSED');
      print('  - Hora 8:00:00 AM detectada: ${dateTimeService.isEightAM(eightAM)}');
      print('  - Hora 8:00:01 AM rechazada: ${dateTimeService.isEightAM(eightAM01)}');
      print('  - Retos se renuevan cada 24h a las 8:00 AM');
      print('  - Programación para: ${scheduledTime.hour}:${scheduledTime.minute}');
    });
  });
}
