import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'dart:io' show Platform;
import 'package:chall_up/services/date_time_service.dart';
import 'package:chall_up/services/session_service.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();
  final DateTimeService _dateTimeService = DateTimeService();
  final SessionService _sessionService = SessionService();
  
  static const int _dailyChallengeNotificationId = 1001;
  static const String _dailyChallengeChannelId = 'daily_challenge_channel';
  static const String _dailyChallengeChannelName = 'Retos Diarios';
  static const String _dailyChallengeChannelDescription = 'Notificaciones de retos diarios a las 8:00 AM';

  NotificationService._internal();

  factory NotificationService() => _instance;

  Future<void> initialize() async {
    tz_data.initializeTimeZones();
    // CAMBIO: @drawable -> @mipmap
    final androidInitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    final darwinInitializationSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    final initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    
    await _notifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
    
    await _createNotificationChannel();
  }

  Future<void> _createNotificationChannel() async {
    if (Platform.isAndroid) {
      final androidChannel = AndroidNotificationChannel(
        _dailyChallengeChannelId,
        _dailyChallengeChannelName,
        description: _dailyChallengeChannelDescription,
        importance: Importance.high,
        playSound: true,
        enableVibration: true,
      );
      
      await _notifications
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidChannel);
    }
  }

  Future<bool> requestPermissions() async {
    if (Platform.isIOS) {
      final permissionStatus = await _notifications.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return permissionStatus ?? false;
    } else if (Platform.isAndroid) {
      final permission = await Permission.notification.request();
      return permission.isGranted;
    }
    
    return true;
  }

  Future<bool> getNotificationStatus() async {
    if (Platform.isIOS) {
      final status = await _notifications.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.getNotificationAppLaunchDetails();
      return status?.didNotificationLaunchApp ?? false;
    } else if (Platform.isAndroid) {
      final permissionStatus = await Permission.notification.status;
      return permissionStatus.isGranted;
    }
    
    return true;
  }

  Future<void> scheduleDailyChallenge(String challengeText, String userId) async {
    final notificationsEnabled = await _sessionService.areNotificationsEnabled();
    if (!notificationsEnabled) {
      throw Exception('Notificaciones deshabilitadas por el usuario');
    }

    final hasPermissions = await getNotificationStatus();
    if (!hasPermissions) {
      throw Exception('Permisos de notificación no otorgados');
    }

    final scheduledTime = _dateTimeService.getNextScheduledTime(8, 0);
    
    final payload = {
      'type': 'daily_challenge',
      'userId': userId,
      'challengeText': challengeText,
      'timestamp': scheduledTime.millisecondsSinceEpoch.toString(),
    }.toString();

    await _notifications.zonedSchedule(
      _dailyChallengeNotificationId,
      'Nuevo Reto Diario',
      challengeText,
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _dailyChallengeChannelId,
          _dailyChallengeChannelName,
          channelDescription: _dailyChallengeChannelDescription,
          importance: Importance.high,
          priority: Priority.high,
          showWhen: false,
          // CAMBIO: Eliminado el icon o cambiado a @mipmap
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: payload,
    );
  }

  Future<void> cancelScheduledNotifications() async {
    await _notifications.cancel(_dailyChallengeNotificationId);
  }

  Future<void> updateChallengeNotification(String newChallengeText, String userId) async {
    await cancelScheduledNotifications();
    await scheduleDailyChallenge(newChallengeText, userId);
  }

  void _onNotificationTap(NotificationResponse response) {
    try {
      if (response.payload != null) {
        final payload = response.payload!;
      }
    } catch (e) {
    }
  }

  Future<void> scheduleTodayReminder(String challengeText, String userId) async {
    final now = _dateTimeService.now();
    final eightAMToday = _dateTimeService.getNextScheduledTime(8, 0);
    
    if (eightAMToday.day == now.day && eightAMToday.isAfter(now)) {
      await scheduleDailyChallenge(challengeText, userId);
    } else {
      await scheduleDailyChallenge(challengeText, userId);
    }
  }

  Future<Map<String, dynamic>> getNotificationScheduleStatus() async {
    final pendingNotifications = await _notifications.pendingNotificationRequests();
    final isScheduled = pendingNotifications.any((notification) => 
        notification.id == _dailyChallengeNotificationId);
    
    return {
      'isScheduled': isScheduled,
      'scheduledNotificationsCount': pendingNotifications.length,
      'dailyChallengeScheduled': isScheduled,
    };
  }

  static const int _reminderNotificationId = 1002;
  static const String _reminderChannelId = 'reminder_channel';
  static const String _reminderChannelName = 'Recordatorio Reto Diario';
  static const String _reminderChannelDescription = 'Recordatorios para completar retos diarios';

  Future<void> scheduleReminder6PM(String challengeText, String userId) async {
    final notificationsEnabled = await _sessionService.areNotificationsEnabled();
    if (!notificationsEnabled) return;

    final hasPermissions = await getNotificationStatus();
    if (!hasPermissions) return;

    final scheduledTime = _dateTimeService.getNextScheduledTime(18, 0);

    final payload = {
      'type': 'reminder',
      'userId': userId,
      'challengeText': challengeText,
    }.toString();

    await _notifications.zonedSchedule(
      _reminderNotificationId,
      '⏰ ¡Faltan 2 horas para el cierre del día!',
      'Completa tu reto diario "$challengeText" para no perder progreso. 😎',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          _reminderChannelId,
          _reminderChannelName,
          channelDescription: _reminderChannelDescription,
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      payload: payload,
    );
  }

  Future<void> cancelReminder() async {
    await _notifications.cancel(_reminderNotificationId);
  }
}