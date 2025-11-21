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
      
      final eightAM = tz.TZDateTime(tz.local, 2025, 11, 16, 8, 0, 0);
      expect(dateTimeService.isEightAM(eightAM), isTrue);
      expect(eightAM.hour, equals(8));
      expect(eightAM.minute, equals(0));
      expect(eightAM.second, equals(0));
      
      final eightAM01 = tz.TZDateTime(tz.local, 2025, 11, 16, 8, 0, 1);
      expect(dateTimeService.isEightAM(eightAM01), isFalse);
      
      final currentTime = tz.TZDateTime(tz.local, 2025, 11, 16, 7, 30, 0);
      final scheduledTime = dateTimeService.getNextScheduledTime(8, 0);
      
      expect(scheduledTime.hour, equals(8));
      expect(scheduledTime.minute, equals(0));
      
      expect(scheduledTime.hour, greaterThanOrEqualTo(0));
      expect(scheduledTime.hour, lessThan(24));
    });
  });
}
