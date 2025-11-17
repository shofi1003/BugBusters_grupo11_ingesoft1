import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/utils/cuestionario_flow.dart';


// ============================================================================
// TEST 1: siguientePreguntaSegunHobby
// ============================================================================
//
// Objetivo del test:
// -------------------
// Validar que la función siguientePreguntaSegunHobby() retorne correctamente
// la siguiente pregunta del cuestionario dependiendo del hobby principal.
//
// Función evaluada (comportamiento real de la app):
// -------------------------------------------------
// * "ejercicio" → "metas_ejercicio"
// * "lectura"   → "metas_lectura"
// * "musica"    → "metas_musica"        <-- tu app funciona así
// * cualquier otro valor → "momento_dia"
//
// Se prueban los siguientes casos:
// 1. Hobby conocido (ejercicio)
// 2. Hobby conocido (lectura)
// 3. Hobby conocido (musica)
// 4. Hobby vacío
// 5. Hobby desconocido
//
// NOTA: No hay test dentro de test. Cada caso es un test independiente.
// ============================================================================

void main() {
  group('Test siguientePreguntaSegunHobby', () {
    // Casos reales de la app
    final casos = [
      ('ejercicio', 'metas_ejercicio'),
      ('lectura', 'metas_lectura'),
      ('musica', 'metas_musica'),   // <-- se ajustó a la lógica REAL
      ('', 'momento_dia'),
      ('otro', 'momento_dia'),
    ];

    // Ejecutar cada caso como un test independiente
    for (final caso in casos) {
      final entrada = caso.$1;
      final esperado = caso.$2;

      test('Entrada "$entrada" → Retorna "$esperado"', () {
        final salida = siguientePreguntaSegunHobby(entrada);
        expect(salida, esperado);
      });
    }
  });
}
