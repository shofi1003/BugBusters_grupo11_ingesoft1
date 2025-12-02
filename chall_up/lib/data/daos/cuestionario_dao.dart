import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/respuesta.dart';

part 'cuestionario_dao.g.dart';

@DriftAccessor(tables: [Respuestas])
class CuestionarioDao extends DatabaseAccessor<AppDatabase>
    with _$CuestionarioDaoMixin {
  CuestionarioDao(AppDatabase db) : super(db);

  /// Guarda la respuesta de un usuario a una pregunta
  Future<void> guardarRespuesta({
    required int preguntaId,
    required int usuarioId,
    required String respuesta,
  }) async {
    await into(respuestas).insert(
      RespuestasCompanion.insert(
        preguntaId: preguntaId,
        usuarioId: usuarioId,
        respuestaTexto: Value(respuesta),
      ),
    );
  }

  /// Obtiene todas las respuestas de un usuario
  Future<List<Respuesta>> obtenerRespuestasUsuario(int usuarioId) {
    return (select(respuestas)
      ..where((tbl) => tbl.usuarioId.equals(usuarioId)))
        .get();
  }
}
