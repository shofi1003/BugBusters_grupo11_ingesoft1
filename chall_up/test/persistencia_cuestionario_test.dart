import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:chall_up/data/daos/cuestionario_dao.dart';


// ============================================================================
// TEST 3: Persistencia del Cuestionario en Base de Datos (Drift)
// ============================================================================
//
// Objetivo del test:
// -------------------
// Validar que guardarPreguntasYRespuestas():
//   ✔ Inserta un cuestionario nuevo
//   ✔ Inserta tantas preguntas como entradas haya en el mapa
//   ✔ Inserta las respuestas correspondientes
//   ✔ Guarda datos no vacíos
//
// NOTA IMPORTANTE:
// ----------------
// Se usa AppDatabase.test() → BD en memoria solo para test.
// Esto NO modifica la base de datos real del usuario.
//
// Caso probado:
// --------------
// preguntasYRespuestas = {
//    "hobby_principal": "lectura",
//    "momento_dia": "noche"
// }
//
// Esperado:
//   2 preguntas insertadas
//   2 respuestas insertadas
//
// ============================================================================

void main() {
  group('Test persistencia cuestionario', () {
    test('Inserta preguntas y respuestas correctamente', () async {
      // Base de datos en memoria (modo test)
      final db = AppDatabase.test();
      final dao = CuestionarioDao(db);

      // Datos simulados
      final datos = {
        'hobby_principal': 'lectura',
        'momento_dia': 'noche',
      };

      // Llamada al método real
      await dao.guardarPreguntasYRespuestas(
        usuarioId: 1,
        preguntasYRespuestas: datos,
      );

      // Consultas reales a la BD
      final preguntas = await db.select(db.preguntas).get();
      final respuestas = await db.select(db.respuestas).get();

      // Validaciones
      expect(preguntas.length, datos.length);
      expect(respuestas.length, datos.length);

      expect(preguntas.first.texto.isNotEmpty, true);
      expect(respuestas.first.respuestaTexto, isNotNull);
    });
  });
}
