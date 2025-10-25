@echo off
REM ################################
REM Configuración inicial
REM Levanta el repositorio y prepara el entorno
REM ################################

REM Navegar al directorio del proyecto Flutter
cd Proyecto

REM Instalar dependencias de Flutter
echo 📥 Instalando dependencias de Flutter...
flutter pub get

REM Ejecutar pruebas básicas
echo 🧪 Ejecutando pruebas básicas...
flutter test

echo ✅ Configuración completada - Proyecto listo para ejecución
