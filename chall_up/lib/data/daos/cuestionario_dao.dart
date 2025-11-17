// lib/data/daos/cuestionario_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/cuestionario.dart';
import '../tables/pregunta.dart';
import '../tables/respuesta.dart';

part 'cuestionario_dao.g.dart';

@DriftAccessor(tables: [Cuestionarios, Preguntas, Respuestas])
class CuestionarioDao extends DatabaseAccessor<AppDatabase>
    with _$CuestionarioDaoMixin {
  CuestionarioDao(AppDatabase db) : super(db);

  Future<int> crearCuestionario(int usuarioId) {
    return into(cuestionarios).insert(
      CuestionariosCompanion.insert(
        usuarioId: usuarioId,
      ),
    );
  }

  /// Guarda preguntas y respuestas cerradas (texto pregunta -> texto respuesta)
  Future<void> guardarPreguntasYRespuestas({
    required int usuarioId,
    required Map<String, String> preguntasYRespuestas,
  }) async {
    final cuestionarioId = await crearCuestionario(usuarioId);

    for (final entry in preguntasYRespuestas.entries) {
      final preguntaId = await into(preguntas).insert(
        PreguntasCompanion.insert(
          cuestionarioId: cuestionarioId,
          texto: entry.key,
          tipo: 'opcion', // todas son cerradas
        ),
      );

      await into(respuestas).insert(
        RespuestasCompanion.insert(
          preguntaId: preguntaId,
          usuarioId: usuarioId,
          respuestaTexto: Value(entry.value),
        ),
      );
    }
  }
}
