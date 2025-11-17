# Análisis Comparativo del Proyecto ChallUp

## Introducción

Este documento presenta un análisis detallado de los cambios realizados entre el proyecto original en la rama "ColdFix0" del repositorio de GitHub y el proyecto actual. El objetivo es documentar todas las modificaciones, mejoras y nuevas funcionalidades implementadas.

## Estructura General del Proyecto

### Repositorio Original (ColdFix0)
- **Ubicación**: `chall_up/Repositorio/BugBusters_grupo11_ingesoft1-ColdFix0/chall_up/`
- **Enfoque**: Estructura base del proyecto con funcionalidades esenciales
- **Tests**: 3 tests unitarios enfocados en operaciones de usuario

### Proyecto Actual
- **Ubicación**: `chall_up/`
- **Enfoque**: Versión mejorada con nuevas funcionalidades de notificaciones y gestión de sesión
- **Tests**: 1 test funcional comprehensivo que cubre flujos completos

## Comparación Detallada de Dependencias

### Archivo: pubspec.yaml

#### Dependencias Añadidas en el Proyecto Actual

1. **flutter_local_notifications: ^17.2.1**
   - **Propósito**: Sistema de notificaciones locales para Android/iOS
   - **Funcionalidad**: Permite programar y mostrar notificaciones push al usuario
   - **Impacto**: Mejora la retención de usuarios mediante recordatorios y actualizaciones

2. **timezone: ^0.9.4**
   - **Propósito**: Manejo avanzado de zonas horarias
   - **Funcionalidad**: Permite programar notificaciones en horarios específicos considerando la zona horaria del dispositivo
   - **Impacto**: Garantiza que las notificaciones se muestren a la hora correcta independientemente de la ubicación del usuario

3. **shared_preferences: ^2.2.2**
   - **Propósito**: Persistencia de datos locales sencilla
   - **Funcionalidad**: Almacena datos de sesión, preferencias de usuario y estado de la aplicación
   - **Impacto**: Permite el auto-login y recordar configuraciones del usuario

4. **permission_handler: ^11.3.1**
   - **Propósito**: Manejo de permisos del sistema operativo
   - **Funcionalidad**: Solicita y gestiona permisos para notificaciones, ubicación, etc.
   - **Impacto**: Mejora la experiencia del usuario al manejar permisos de forma elegante

#### Dependencias Eliminadas

1. **mockito: ^5.4.4** (dev_dependencies)
   - **Razón**: Eliminado de las dependencias de desarrollo
   - **Impacto**: Se simplificó la configuración de testing, posiblemente reemplazado por enfoques más directos

## Nuevos Servicios Implementados

### 1. SessionService (lib/services/session_service.dart)

#### Funcionalidades Principales
- **Gestión de credenciales**: Guarda y recupera credenciales de usuario de forma segura
- **Auto-login**: Permite iniciar sesión automáticamente al abrir la aplicación
- **Control de notificaciones**: Gestiona el estado de habilitación/deshabilitación de notificaciones
- **Persistencia**: Utiliza SharedPreferences para mantener el estado entre sesiones

#### Métodos Clave
```dart
// Guarda credenciales para auto-login
Future<void> saveCredentials(String email, String password)

// Recupera credenciales guardadas
Future<Map<String, String?>?> getSavedCredentials()

// Limpia credenciales (logout)
Future<void> clearCredentials()

// Control de notificaciones
Future<void> toggleNotifications()
Future<bool> areNotificationsEnabled()
```

#### Impacto en la Experiencia del Usuario
- **Conveniencia**: Los usuarios no necesitan ingresar credenciales en cada sesión
- **Personalización**: Los usuarios pueden controlar si desean recibir notificaciones
- **Persistencia**: Las preferencias del usuario se mantienen entre reinicios

### 2. DateTimeService (lib/services/date_time_service.dart)

#### Funcionalidades Principales
- **Manejo de tiempo**: Proporciona métodos para trabajar con fechas y horas
- **Programación de notificaciones**: Calcula tiempos futuros para programar notificaciones
- **Validación horaria**: Verifica si un momento específico coincide con horarios objetivo
- **Soporte para testing**: Facilita las pruebas con tiempos controlados

#### Métodos Clave
```dart
// Verifica si es exactamente las 8:00 AM
bool isEightAM(tz.TZDateTime time)

// Obtiene el próximo tiempo programado
tz.TZDateTime getNextScheduledTime(int targetHour, int targetMinute)

// Manejo de zonas horarias
tz.TZDateTime now()
```

#### Horarios Implementados
- **8:00 AM**: Renovación diaria de retos
- **6:00 PM**: Notificación de advertencia (posible implementación futura)

## Mejoras en Servicios Existentes

### UsuarioService
- **Integración con SessionService**: Ahora puede trabajar con credenciales guardadas
- **Mejor manejo de errores**: Validación más robusta de credenciales
- **Persistencia**: Los datos de usuario pueden persistir entre sesiones

## Nueva Funcionalidad: Sistema de Notificaciones

### Arquitectura del Sistema
1. **Programación**: Utiliza DateTimeService para calcular tiempos de notificación
2. **Control**: SessionService gestiona si el usuario desea recibir notificaciones
3. **Visualización**: flutter_local_notifications muestra las notificaciones al usuario
4. **Permisos**: permission_handler solicita los permisos necesarios

### Flujo de Notificaciones
1. **Inicialización**: Se solicitan permisos al primer uso
2. **Programación**: Se programan notificaciones para horarios específicos
3. **Control de usuario**: El usuario puede habilitar/deshabilitar notificaciones
4. **Persistencia**: El estado de las notificaciones se mantiene entre sesiones

## Cambios en la Base de Datos

### Tablas Existentes
- **Sin cambios significativos**: Las tablas de la base de datos permanecen iguales
- **Compatibilidad**: Se mantiene la compatibilidad con la estructura existente

### Posibles Extensiones
- **Notificaciones**: Podría añadirse una tabla para registrar notificaciones enviadas
- **Preferencias**: Podrían almacenarse preferencias de usuario en la base de datos

## Mejoras en la Interfaz de Usuario

### PerfilScreen
- **Control de notificaciones**: Se añadió la capacidad de habilitar/deshabilitar notificaciones
- **Gestión de sesión**: Mejor manejo del cierre de sesión y limpieza de credenciales

### LoginScreen
- **Auto-login**: Se añadió la funcionalidad de recordar credenciales
- **Mejor validación**: Validación más robusta de credenciales

## Documentación Adicional

### README_NOTIFICACIONES.md
- **Nuevo archivo**: Documentación específica sobre el sistema de notificaciones
- **Instrucciones**: Guía para probar y configurar el sistema de notificaciones
- **Comandos**: Scripts para probar notificaciones en desarrollo

### Scripts de Desarrollo
- **actualizar_y_probar_notificaciones.bat/sh**: Scripts para probar notificaciones
- **iniciar_con_emulador.bat**: Mejoras en el proceso de desarrollo
- **auto_reload.bat**: Mejoras en el desarrollo iterativo

## Impacto General de los Cambios

### Ventajas
1. **Mejor Experiencia de Usuario**: Auto-login y control de notificaciones
2. **Mayor Retención**: Las notificaciones ayudan a mantener activos a los usuarios
3. **Personalización**: Los usuarios pueden adaptar la aplicación a sus preferencias
4. **Robustez**: Mejor manejo de errores y validación de datos

### Desafíos
1. **Complejidad**: El sistema es más complejo que la versión original
2. **Dependencias**: Mayor número de dependencias externas
3. **Pruebas**: Necesidad de pruebas más comprehensivas para cubrir nuevos flujos

### Mantenimiento
1. **Documentación**: Se ha mejorado significativamente la documentación
2. **Testing**: Se han añadido pruebas funcionales comprehensivas
3. **Organización**: Mejor estructuración del código y separación de responsabilidades

## Recomendaciones Futuras

### Mejoras de Testing
1. **Tests Unitarios**: Ampliar la cobertura de tests unitarios para nuevos servicios
2. **Tests de Integración**: Añadir tests que cubran la integración entre servicios
3. **Tests de UI**: Implementar tests de interfaz de usuario

### Mejoras de Seguridad
1. **Almacenamiento Seguro**: Considerar el uso de almacenamiento más seguro para credenciales
2. **Validación**: Mejorar la validación de datos de entrada
3. **Encriptación**: Considerar encriptar datos sensibles

### Mejoras de Rendimiento
1. **Optimización**: Optimizar el uso de recursos en el manejo de notificaciones
2. **Caché**: Implementar caché para datos frecuentemente accedidos
3. **Lazy Loading**: Cargar recursos solo cuando sean necesarios

## Conclusión

El proyecto actual representa una evolución significativa del proyecto original, añadiendo funcionalidades importantes que mejoran considerablemente la experiencia del usuario. Las principales mejoras incluyen:

- **Sistema de notificaciones** completo y programable
- **Gestión de sesión** con auto-login
- **Control de preferencias** del usuario
- **Mejor testing** con pruebas funcionales comprehensivas
- **Mejor documentación** y herramientas de desarrollo

Estos cambios posicionan al proyecto para una mejor adopción por parte de los usuarios y proporcionan una base sólida para futuras expansiones y mejoras.
