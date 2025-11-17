# Documentación de Tests Funcionales - ChallUp

## Introducción

Este documento proporciona una explicación detallada de todos los tests implementados en el proyecto ChallUp, tanto los tests originales del repositorio ColdFix0 como el nuevo test funcional comprehensivo. Cada bloque de código está explicado para facilitar la comprensión y el mantenimiento del código.

## Filosofía de Testing

### Enfoque Original (ColdFix0)
- **Tests Unitarios**: Enfocados en validar funcionalidades específicas
- **Cobertura**: Login, registro y actualización de usuarios
- **Estrategia**: Pruebas aisladas de componentes individuales

### Enfoque Actual
- **Test Funcional**: Validación de flujos completos de usuario
- **Cobertura**: Gestión de sesión, notificaciones y manejo de tiempo
- **Estratetica**: Pruebas integradas que simulan escenarios reales de uso

## Documentación de Tests Originales

### 1. Login Test (test/usuario/login_test.dart)

#### Propósito
Validar el proceso de autenticación de usuarios, asegurando que el sistema maneje correctamente credenciales válidas e inválidas.

#### Estructura del Test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:chall_up/data/daos/usuario_dao.dart';
import 'package:chall_up/services/usuario_service.dart';
import 'package:chall_up/utils/hash_helper.dart';
import 'package:drift/native.dart';
```

**Explicación**: Importa todas las dependencias necesarias para el test, incluyendo el framework de testing, componentes del proyecto y la base de datos en memoria.

```dart
void main() {
  late AppDatabase db;
  late UsuarioDao usuarioDao;
  late UsuarioService usuarioService;

  setUp(() {
    db = AppDatabase.forTest(NativeDatabase.memory());
    usuarioDao = UsuarioDao(db);
    usuarioService = UsuarioService(usuarioDao);
  });
```

**Explicación**: Configuración del entorno de testing. Se crea una base de datos en memoria para pruebas, se inicializan el DAO (Data Access Object) y el servicio de usuario.

```dart
  tearDown(() async {
    await db.close();
  });
```

**Explicación**: Limpieza después de cada test. Cierra la conexión a la base de datos para evitar conflictos entre pruebas.

#### Caso de Prueba 1: Login Correcto

```dart
  test('Login correcto con credenciales válidas', () async {
    final correo = "login@test.com";
    final password = "Hola1234";
    final hashed = HashHelper.hashPassword(password);

    await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Test User",
        correo: correo,
        password: hashed,
      ),
    );

    final result = await usuarioService.iniciarSesion(correo, password);
    expect(result, 'Inicio de sesión exitoso');
  });
```

**Explicación Paso a Paso**:
1. **Preparación**: Define credenciales de prueba
2. **Encriptación**: Convierte la contraseña a hash usando HashHelper
3. **Inserción**: Crea un usuario en la base de datos de prueba
4. **Prueba**: Intenta iniciar sesión con las credenciales
5. **Validación**: Verifica que el resultado sea el mensaje de éxito esperado

#### Caso de Prueba 2: Contraseña Incorrecta

```dart
  test('Login falla con contraseña incorrecta', () async {
    final correo = "user@test.com";
    final password = "Hola1234";
    final hashed = HashHelper.hashPassword(password);

    await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Usuario",
        correo: correo,
        password: hashed,
      ),
    );

    final result = await usuarioService.iniciarSesion(correo, "ClaveIncorrecta1");
    expect(result, 'Credenciales incorrectas');
  });
```

**Explicación**: Similar al caso anterior, pero prueba el escenario de error cuando se proporciona una contraseña incorrecta.

#### Caso de Prueba 3: Usuario No Registrado

```dart
  test('Login falla si el correo no está registrado', () async {
    final result = await usuarioService.iniciarSesion("no_existe@mail.com", "Hola1234");
    expect(result, 'Usuario no encontrado');
  });
```

**Explicación**: Prueba el escenario donde se intenta iniciar sesión con un correo que no existe en la base de datos.

### 2. Registro Test (test/usuario/registro_test.dart)

#### Propósito
Validar el proceso de registro de nuevos usuarios, incluyendo la validación de datos y la prevención de duplicados.

#### Estructura del Test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:chall_up/data/daos/usuario_dao.dart';
import 'package:chall_up/utils/validators.dart';
import 'package:chall_up/utils/hash_helper.dart';
import 'package:drift/native.dart';
```

**Explicación**: Importa los componentes necesarios, incluyendo el validador de datos.

#### Caso de Prueba 1: Registro Exitoso

```dart
  test('Registrar usuario correctamente', () async {
    final nombre = "Usuario";
    final correo = "test@challup.com";
    final password = "Hola1234";

    expect(Validators.isValidName(nombre), true);
    expect(Validators.isValidEmail(correo), true);
    expect(Validators.isValidPassword(password), true);

    final hashed = HashHelper.hashPassword(password);

    final usuarioId = await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: nombre,
        correo: correo,
        password: hashed,
      ),
    );

    expect(usuarioId, isNonZero);
  });
```

**Explicación Paso a Paso**:
1. **Definición**: Establece datos de prueba para el usuario
2. **Validación**: Verifica que los datos cumplan con las reglas de validación
3. **Encriptación**: Convierte la contraseña a hash
4. **Inserción**: Crea el usuario en la base de datos
5. **Verificación**: Confirma que se obtuvo un ID de usuario válido (no cero)

#### Caso de Prueba 2: Correo Duplicado

```dart
  test('No permite registrar correo duplicado', () async {
    final hashed = HashHelper.hashPassword("Hola1234");

    await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Prueba2",
        correo: "fail@challup.com",
        password: hashed,
      ),
    );

    expect(
      () async {
        await usuarioDao.insertarUsuario(
          UsuariosCompanion.insert(
            nombre: "Prueba3",
            correo: "fail@challup.com",
            password: hashed,
          ),
        );
      },
      throwsException,
    );
  });
```

**Explicación**: Prueba que el sistema prevenga el registro de usuarios con correos electrónicos duplicados, esperando que se lance una excepción.

#### Caso de Prueba 3: Validaciones de Datos

```dart
  test('Validaciones fallan correctamente', () {
    expect(Validators.isValidEmail("correo_malo"), false);
    expect(Validators.isValidPassword("malo"), false);
    expect(Validators.isValidName("A"), false);
  });
```

**Explicación**: Verifica que las funciones de validación rechacen correctamente datos inválidos.

### 3. Actualización de Usuario Test (test/usuario/actualizar_usuario_test.dart)

#### Propósito
Validar la actualización parcial de datos de usuario, permitiendo modificar solo ciertos campos sin afectar otros.

#### Estructura del Test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:chall_up/data/daos/usuario_dao.dart';
import 'package:chall_up/utils/hash_helper.dart';
import 'package:drift/native.dart';
```

**Explicación**: Importa los componentes necesarios para el test.

#### Caso de Prueba 1: Actualización Completa

```dart
  test('Actualizar nombre, teléfono y contraseña del usuario', () async {
    final usuarioId = await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Usuario Inicial",
        correo: "usuario@test.com",
        password: HashHelper.hashPassword("Password123"),
      ),
    );

    expect(usuarioId, isNonZero);

    final nuevoNombre = "Usuario Actualizado";
    final nuevoTelefono = "1234567890";
    final nuevaPassword = "NuevaPass123";

    final ok = await usuarioDao.actualizarUsuarioParcial(
      id: usuarioId,
      nombre: nuevoNombre,
      telefono: nuevoTelefono,
      password: HashHelper.hashPassword(nuevaPassword),
    );

    expect(ok, true);

    final usuarioActualizado = await usuarioDao.obtenerUsuarioPorId(usuarioId);

    expect(usuarioActualizado, isNotNull);
    expect(usuarioActualizado!.nombre, nuevoNombre);
    expect(usuarioActualizado.telefono, nuevoTelefono);
    expect(usuarioActualizado.password, HashHelper.hashPassword(nuevaPassword));
  });
```

**Explicación Paso a Paso**:
1. **Creación**: Inserta un usuario de prueba
2. **Validación**: Verifica que el usuario se creó correctamente
3. **Definición**: Establece los nuevos datos a actualizar
4. **Actualización**: Llama al método de actualización parcial
5. **Verificación**: Confirma que la actualización fue exitosa
6. **Consulta**: Obtiene el usuario actualizado de la base de datos
7. **Validación Final**: Verifica que todos los campos se actualizaron correctamente

#### Caso de Prueba 2: Actualización Parcial

```dart
  test('Actualizar solo nombre del usuario', () async {
    final usuarioId = await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Usuario Inicial",
        correo: "usuario2@test.com",
        password: HashHelper.hashPassword("Password123"),
      ),
    );

    expect(usuarioId, isNonZero);

    final nuevoNombre = "Nombre Solo Actualizado";

    final ok = await usuarioDao.actualizarUsuarioParcial(
      id: usuarioId,
      nombre: nuevoNombre,
      telefono: null,
      password: null,
    );

    expect(ok, true);

    final usuarioActualizado = await usuarioDao.obtenerUsuarioPorId(usuarioId);

    expect(usuarioActualizado, isNotNull);
    expect(usuarioActualizado!.nombre, nuevoNombre);
    expect(usuarioActualizado.telefono, isNull);
    expect(usuarioActualizado.password, HashHelper.hashPassword("Password123"));
  });
```

**Explicación**: Prueba la actualización parcial donde solo se modifica el nombre, dejando el teléfono como null y manteniendo la contraseña original.

## Documentación del Test Funcional Actual

### Functional Test (test/functional_test.dart)

#### Propósito
Validar flujos completos de usuario que involucran múltiples servicios y componentes, simulando escenarios de uso real de la aplicación.

#### Estructura del Test

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:chall_up/services/session_service.dart';
import 'package:chall_up/services/date_time_service.dart';
```

**Explicación**: Importa todas las dependencias necesarias, incluyendo las nuevas librerías para manejo de preferencias y zonas horarias.

```dart
void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    tz_data.initializeTimeZones();
  });

  setUp(() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await prefs.setBool('notifications_enabled', true);
  });
```

**Explicación**:
- **setUpAll**: Configuración global para todos los tests. Inicializa SharedPreferences como mock y las zonas horarias.
- **setUp**: Configuración antes de cada test. Limpia las preferencias y establece un estado inicial consistente.

#### Grupo de Pruebas: Flujo Completo de Auto-Login

```dart
  group('Pruebas Funcionales Esenciales - ChallUp', () {
    
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
```

**Explicación Detallada**:

**Fase 1 - Guardado de Credenciales**:
- Crea una instancia del SessionService
- Guarda credenciales de usuario usando el método saveCredentials
- Verifica que las credenciales se guardaron correctamente
- Valida que tanto el email como la contraseña estén almacenados

**Fase 2 - Persistencia entre Instancias**:
- Crea una nueva instancia del SessionService (simula reinicio de app)
- Intenta recuperar las credenciales guardadas
- Verifica que las credenciales persisten entre diferentes instancias
- Confirma que los datos recuperados son idénticos a los guardados originalmente

**Fase 3 - Limpieza de Credenciales**:
- Llama al método clearCredentials para eliminar las credenciales guardadas
- Verifica que no quedan credenciales almacenadas
- Confirma que el sistema permite un logout completo

#### Grupo de Pruebas: Control de Notificaciones

```dart
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
```

**Explicación Detallada**:

**Verificación del Estado Inicial**:
- Verifica que las notificaciones están habilitadas por defecto
- Este es el comportamiento esperado para una mejor experiencia de usuario

**Primer Toggle (Encender/Apagar)**:
- Llama a toggleNotifications() para cambiar el estado
- Verifica que las notificaciones estén desactivadas
- Confirma que el cambio de estado funciona correctamente

**Segundo Toggle (Apagar/Encender)**:
- Llama nuevamente a toggleNotifications() para restaurar el estado
- Verifica que las notificaciones estén activadas de nuevo
- Confirma que el toggle es reversible y funcional

**Persistencia entre Instancias**:
- Crea una nueva instancia del servicio (simula reinicio de la app)
- Verifica que el estado de las notificaciones se mantenga
- Confirma que las preferencias del usuario persisten

#### Grupo de Pruebas: Programación de Notificaciones

```dart
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
```

**Explicación Detallada**:

**Test 1 - Hora Exacta de 8:00 AM**:
- Crea un objeto de tiempo específico para las 8:00:00 AM del 16/11/2025
- Verifica que el método isEightAM() lo reconozca correctamente
- Confirma que las componentes de hora, minuto y segundo sean exactamente 8, 0, 0

**Test 2 - Hora Cercana pero No Exacta**:
- Crea un tiempo de 8:00:01 AM (un segundo después de las 8:00 AM)
- Verifica que el método isEightAM() rechace este tiempo
- Confirma que la validación es precisa hasta el segundo

**Test 3 - Programación Inteligente**:
- Establece una hora actual de 7:30 AM
- Solicita el próximo tiempo programado para las 8:00 AM
- Verifica que el tiempo programado sea exactamente a las 8:00 AM
- Confirma que el día sea hoy o mañana dependiendo de si ya pasó la hora objetivo

## Comparación de Enfoques de Testing

### Tests Unitarios (Original)
**Ventajas**:
- **Enfoque específico**: Cada test valida una funcionalidad concreta
- **Rapidez**: Se ejecutan rápidamente al no requerir muchos componentes
- **Facilidad de depuración**: Errores son fáciles de localizar
- **Independencia**: Cada test es independiente de los demás

**Desventajas**:
- **Cobertura limitada**: No validan flujos completos
- **Integración**: No prueban la interacción entre componentes
- **Escenarios reales**: No simulan casos de uso completos

### Test Funcional (Actual)
**Ventajas**:
- **Flujos completos**: Valida escenarios de uso real
- **Integración**: Prueba la interacción entre múltiples servicios
- **Experiencia de usuario**: Simula comportamientos reales de los usuarios
- **Robustez**: Detecta problemas en la integración de componentes

**Desventajas**:
- **Complejidad**: Más complejo de escribir y mantener
- **Velocidad**: Se ejecutan más lentamente
- **Dependencia**: Más sensible a cambios en múltiples componentes

## Recomendaciones para Testing Futuro

### Mejoras de Cobertura
1. **Tests Unitarios para Nuevos Servicios**: Crear tests unitarios específicos para SessionService y DateTimeService
2. **Tests de Integración**: Validar la integración entre servicios y la base de datos
3. **Tests de UI**: Implementar tests de interfaz de usuario para validar flujos visuales

### Mejoras de Calidad
1. **Datos de Prueba**: Crear generadores de datos de prueba consistentes
2. **Mocking**: Mejorar el uso de mocks para dependencias externas
3. **Documentación**: Mantener la documentación de tests actualizada

### Mejoras de Mantenimiento
1. **Organización**: Agrupar tests por funcionalidad y nivel de abstracción
2. **Nomenclatura**: Usar nombres de tests descriptivos y consistentes
3. **Setup/Cleanup**: Mejorar la configuración y limpieza de tests

## Conclusión

La evolución de la estrategia de testing en ChallUp refleja el crecimiento del proyecto:

- **Tests Unitarios**: Proporcionan una base sólida para validar funcionalidades individuales
- **Test Funcional**: Añade una capa de validación que asegura que los componentes trabajen juntos correctamente

Esta combinación de enfoques proporciona una cobertura de testing más completa, validando tanto los componentes individuales como los flujos de usuario completos. Para proyectos futuros, se recomienda mantener ambos enfoques para asegurar una calidad de código óptima.
