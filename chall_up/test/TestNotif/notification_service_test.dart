import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chall_up/services/session_service.dart';

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
  });

  setUp(() async {
    // Limpiar SharedPreferences antes de cada test
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    // Establecer estado inicial consistente
    await prefs.setBool('notifications_enabled', true);
  });

  group('Pruebas de Control de Notificaciones - ChallUp', () {
    
    test('control de notificaciones y persistencia de estado', () async {
      final service = SessionService();
      
      // Verificar estado inicial por defecto
      final initialState = await service.areNotificationsEnabled();
      expect(initialState, isTrue, 
             reason: 'El estado inicial debería ser enabled por defecto');
      
      // Alternar notificaciones (encender/apagar/encender)
      await service.toggleNotifications();
      final firstToggle = await service.areNotificationsEnabled();
      expect(firstToggle, isFalse, 
             reason: 'Primera alternancia debería desactivar notificaciones');
      
      await service.toggleNotifications();
      final secondToggle = await service.areNotificationsEnabled();
      expect(secondToggle, isTrue, 
             reason: 'Segunda alternancia debería activar notificaciones');
      
      print('✓ Test: Control de notificaciones - PASSED');
      print('  - Estado inicial: enabled');
      print('  - Primer toggle: disabled');
      print('  - Segundo toggle: enabled');
      
      // Verificar persistencia entre instancias (simula reinicio de app)
      final newService = SessionService();
      final persistedState = await newService.areNotificationsEnabled();
      
      expect(persistedState, isTrue, 
             reason: 'El estado debería persistir después del reinicio');
      
      print('  - Estado persistente: enabled');
    });
  });
}
