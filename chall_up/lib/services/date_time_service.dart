import 'package:timezone/timezone.dart' as tz;

class DateTimeService {
  /// Devuelve la fecha y hora actual del dispositivo
  tz.TZDateTime now() => tz.TZDateTime.now(tz.local);
  
  /// Para tests: devuelve una fecha/hora fija
  tz.TZDateTime fixedTime(int hour, int minute, int second) {
    final now = tz.TZDateTime.now(tz.local);
    return tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
      second,
    );
  }
  
  /// Verifica si una hora es igual a otra (ignorando fecha)
  bool isSameTime(tz.TZDateTime time1, tz.TZDateTime time2) {
    return time1.hour == time2.hour && 
           time1.minute == time2.minute && 
           time1.second == time2.second;
  }
  
  /// Verifica si es exactamente las 8:00 AM
  bool isEightAM(tz.TZDateTime time) {
    return time.hour == 8 && time.minute == 0 && time.second == 0;
  }
  
  /// Verifica si es exactamente las 6:00 PM (para notificación de advertencia)
  bool isSixPM(tz.TZDateTime time) {
    return time.hour == 18 && time.minute == 0 && time.second == 0;
  }
  
  /// Obtiene el próximo tiempo objetivo (para programar notificaciones)
  tz.TZDateTime getNextScheduledTime(int targetHour, int targetMinute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      targetHour,
      targetMinute,
      0,
    );
    
    // Si la hora ya pasó hoy, programar para mañana
    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }
    
    return scheduledTime;
  }
}
