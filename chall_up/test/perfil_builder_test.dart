import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/utils/perfil_builder.dart';


// ============================================================================
// TEST 2: construirResumenPerfil
// ============================================================================
//
// Objetivo del test:
// -------------------
// Validar que la función construirResumenPerfil():
//   ✔ Identifique correctamente el hobby principal
//   ✔ Obtenga las metas asociadas al hobby
//   ✔ Compile correctamente la cadena de hábitos
//
// COMPORTAMIENTO REAL DE LA APP (muy importante):
// ------------------------------------------------
// En la app, los hábitos se guardan así:
//   "momento:<valor>"
//   "frecuencia:<valor>"
//   "nivel:<valor>"
//   "motivación:<valor>"     <-- lleva TILDE
//
// Por eso el test busca "motivación:" y no "motivacion:".
//
// Se prueban dos perfiles completos:
//   1. Hobby: ejercicio
//   2. Hobby: lectura
//
// Cada test revisa:
//   ✔ hobby correcto
//   ✔ metas correctas
//   ✔ hábitos presentes y formateados correctamente
// ============================================================================

void main() {
  group('Test construirResumenPerfil', () {
    final casos = [
      (
      {
        'hobby_principal': 'ejercicio',
        'metas_ejercicio': 'bajar_peso',
        'momento_dia': 'manana',
        'frecuencia': 'diario',
        'nivel_actual': 'principiante',
        'motivacion': 'salud',
      },
      'ejercicio',
      'bajar_peso'
      ),
      (
      {
        'hobby_principal': 'lectura',
        'metas_lectura': 'leer_mas',
        'momento_dia': 'noche',
        'frecuencia': '3_4',
        'nivel_actual': 'intermedio',
        'motivacion': 'crecimiento',
      },
      'lectura',
      'leer_mas'
      ),
    ];

    for (final caso in casos) {
      final respuestas = caso.$1;
      final hobbyEsperado = caso.$2;
      final metaEsperada = caso.$3;

      test('Construcción correcta de perfil para "$hobbyEsperado"', () {
        final perfil = construirResumenPerfil(respuestas);

        // Validación del hobby
        expect(perfil.hobbies, hobbyEsperado);

        // Validación de metas asociadas
        expect(perfil.metas, metaEsperada);

        // Validación de hábitos (incluyendo tilde en "motivación:")
        expect(perfil.habitos.contains('momento:'), true);
        expect(perfil.habitos.contains('frecuencia:'), true);
        expect(perfil.habitos.contains('nivel:'), true);
        expect(perfil.habitos.contains('motivación:'), true);
      });
    }
  });
}
