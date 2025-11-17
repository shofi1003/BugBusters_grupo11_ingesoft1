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

  group('Pruebas de Servicio de Sesión - ChallUp', () {
    
    test('flujo completo de auto-login y credenciales', () async {
      final service = SessionService();
      
      print('✓ Test: Flujo completo de auto-login');
      
      // 1. Usuario inicia sesión con "recordar cuenta" activado
      await service.saveCredentials('usuario@prueba.com', 'password123');
      final savedCredentials = await service.getSavedCredentials();
      
      expect(savedCredentials, isNotNull, 
             reason: 'Las credenciales deberían estar guardadas');
      expect(savedCredentials!['email'], equals('usuario@prueba.com'));
      expect(savedCredentials!['password'], equals('password123'));
      
      print('  - Credenciales guardadas exitosamente');
      
      // 2. App se cierra y vuelve a abrir (simula nueva instancia)
      final newService = SessionService();
      final autoLoginCredentials = await newService.getSavedCredentials();
      
      expect(autoLoginCredentials, isNotNull, 
             reason: 'Debería haber credenciales para auto-login');
      expect(autoLoginCredentials!['email'], equals('usuario@prueba.com'));
      expect(autoLoginCredentials!['password'], equals('password123'));
      
      print('  - Credenciales recuperadas después de reinicio');
      print('  - Email: ${autoLoginCredentials!['email']}');
      
      // 3. Usuario decide no usar auto-login en el futuro
      await service.clearCredentials();
      final afterLogout = await service.getSavedCredentials();
      
      expect(afterLogout, isNull, 
             reason: 'No debería haber credenciales después de limpiar');
      
      print('  - Credenciales limpiadas exitosamente');
    });
  });
}
