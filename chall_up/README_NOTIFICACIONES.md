# Sistema de Notificaciones - Documentación

## Problemas Resueltos

### 1. Notificaciones no se programaban automáticamente
**Problema:** Las notificaciones solo se programaban cuando el usuario presionaba el botón "Reprogramar".

**Solución:** 
- Las notificaciones ahora se programan automáticamente al iniciar sesión
- Se agregó inicialización en `HomeScreen.initState()`
- Se mejoró el manejo de errores

### 2. Falta de notificación de advertencia
**Problema:** Solo había notificación a las 8 AM, pero faltaba la advertencia de 2 horas antes del cierre.

**Solución:**
- Se implementó una segunda notificación a las 6:00 PM
- Mensaje: "⏰ ¡Alerta de cierre! Recuerda completar tu reto diario antes de que cierre a las 8:00 PM"

### 3. Manejo de errores limitado
**Problema:** No había feedback claro cuando las notificaciones fallaban.

**Solución:**
- Mensajes de error específicos para cada tipo de falla
- Logging detallado para debugging
- Feedback visual al usuario mediante SnackBar

### 4. Permisos no gestionados adecuadamente
**Problema:** Los permisos se solicitaban pero no se verificaban adecuadamente.

**Solución:**
- Verificación constante de permisos antes de programar notificaciones
- Mensajes claros indicando qué permiso falta y cómo habilitarlo
- Salida temprana si los permisos no están concedidos

## Nuevas Funcionalidades

### Notificación Matutina (8:00 AM)
- **Mensaje:** "🚀 ¡Nuevo reto disponible! Descubre tu desafío diario en ChallUp"
- **Tipo:** Alta importancia (Importance.max)
- **Propósito:** Informar al usuario que hay un nuevo reto disponible

### Notificación de Advertencia (6:00 PM)
- **Mensaje:** "⏰ ¡Alerta de cierre! Recuerda completar tu reto diario antes de que cierre a las 8:00 PM"
- **Tipo:** Alta importancia (Importance.high)
- **Propósito:** Recordar al usuario que debe completar su reto antes del cierre

## Archivos Modificados

1. **`lib/services/usuario_service.dart`**
   - Mejorado manejo de permisos
   - Agregada notificación de advertencia
   - Mejorado logging y manejo de errores
   - Separación de lógica en métodos independientes

2. **`lib/ui/auth/home_screen.dart`**
   - Inicialización automática de notificaciones
   - Mejorado feedback al usuario
   - Manejo de errores en la UI

3. **`lib/main.dart`**
   - Importación del servicio de usuario

## Scripts de Utilidad

### Windows
- **`reiniciar_app.bat`** - Reinicia la aplicación Flutter
- **`actualizar_y_probar_notificaciones.bat`** - Limpia, reconstruye e inicia la app con modo verbose

### Linux/Mac
- **`reiniciar_app.sh`** - Reinicia la aplicación Flutter
- **`actualizar_y_probar_notificaciones.sh`** - Limpia, reconstruye e inicia la app con modo verbose

## Cómo Probar las Notificaciones

1. **Ejecutar el script de actualización:**
   ```bash
   # Windows
   actualizar_y_probar_notificaciones.bat
   
   # Linux/Mac
   chmod +x actualizar_y_probar_notificaciones.sh
   ./actualizar_y_probar_notificaciones.sh
   ```

2. **Iniciar sesión en la aplicación**

3. **Verificar mensajes de depuración:**
   - Buscar mensajes que empiecen con `[NOTIFICACIÓN]` en la consola
   - Mensajes clave:
     - "✓ Notificación matutina programada EXACTAMENTE"
     - "✓ Notificación de advertencia programada EXACTAMENTE"
     - "ERROR: Permiso de alarmas exactas no concedido"

4. **Usar los botones de test en el menú:**
   - 🔔 Notificaciones activas: Prueba inmediata
   - 📋 Lista: Ver notificaciones pendientes
   - 🔄 Refrescar: Reprogramar notificaciones
   - ❌ Cancelar: Cancelar notificaciones

5. **Probar notificaciones programadas:**
   - Esperar a las 8:00 AM para la notificación matutina
   - Esperar a las 6:00 PM para la notificación de advertencia

## Solución de Problemas Comunes

### Problema: No llegan notificaciones a las 8:00 AM
**Causas posibles:**
1. Permiso de alarmas exactas denegado
2. App en modo ahorro de batería
3. Notificaciones bloqueadas en el sistema

**Soluciones:**
1. Verificar permisos en Ajustes > Apps > ChallUp > Permisos
2. Excluir la app del ahorro de batería
3. Verificar que las notificaciones estén habilitadas

### Problema: Mensaje "ERROR: Permiso de alarmas exactas no concedido"
**Solución:**
1. Ir a Ajustes > Apps > ChallUp > Permisos
2. Habilitar "Permitir alarmas y recordatorios"
3. Reiniciar la aplicación

### Problema: Notificaciones llegan con retraso
**Causas posibles:**
1. Modo ahorro de batería activo
2. Sistema operativo restringiendo servicios en segundo plano

**Soluciones:**
1. Excluir la app del ahorro de batería
2. Verificar que los servicios en segundo plano estén habilitados

## Mejoras Futuras Sugeridas

1. **Zonas horarias configurables:** Permitir al usuario seleccionar su zona horaria
2. **Personalización de horarios:** Permitir al usuario elegir los horarios de notificación
3. **Notificaciones push reales:** Implementar Firebase Cloud Messaging para notificaciones cuando la app está cerrada
4. **Validación de retos:** Verificar si el usuario completó el reto antes de enviar la notificación de advertencia

## Registro de Cambios

- **v1.1:** Implementación de notificación de advertencia (6:00 PM)
- **v1.1:** Mejorado manejo de permisos y errores
- **v1.1:** Inicialización automática de notificaciones
- **v1.1:** Scripts de utilidad para desarrollo
- **v1.1:** Mejorado feedback al usuario
