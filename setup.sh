#!/bin/bash

################################
# Configuración inicial
# Levanta el repositorio y prepara el entorno
################################

# Navegar al directorio del proyecto Flutter
cd Proyecto

# Instalar dependencias de Flutter
echo "📥 Instalando dependencias de Flutter..."
flutter pub get

# Ejecutar pruebas básicas
echo "🧪 Ejecutando pruebas básicas..."
flutter test

echo "✅ Configuración completada - Proyecto listo para ejecución"
