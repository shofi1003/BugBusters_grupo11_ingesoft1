import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/historial_perfil.dart';
import '../tables/perfil.dart';
import '../tables/respuesta.dart';
import '../tables/usuario.dart';

part 'perfil_dao.g.dart';

@DriftAccessor(
  tables: [Usuarios, Perfils, HistorialPerfils, Respuestas],
)
class PerfilDao extends DatabaseAccessor<AppDatabase>
    with _$PerfilDaoMixin {
  PerfilDao(AppDatabase db) : super(db);

  /// Guarda el cuestionario inicial y construye perfil
  Future<void> guardarCuestionarioInicial({
    required int usuarioId,
    required String hobbies,
    required String habitos,
    required String metas,
  }) async {
    // Guardamos en tabla Perfil
    await into(perfils).insertOnConflictUpdate(
      PerfilsCompanion.insert(
        usuarioId: usuarioId,
        hobbies: Value(hobbies),
        habitos: Value(habitos),
        metas: Value(metas),
      ),
    );
  }

  /// Obtiene el perfil asociado a un usuario
  Future<Perfil?> obtenerPerfilPorUsuario(int usuarioId) {
    return (select(perfils)
      ..where((tbl) => tbl.usuarioId.equals(usuarioId)))
        .getSingleOrNull();
  }

  /// Registrar cambio de hobby EN HISTORIAL
  Future<void> registrarCambioHobby({
    required int usuarioId,
    required String valorAnterior,
    required String valorNuevo,
  }) async {
    await into(historialPerfils).insert(
      HistorialPerfilsCompanion.insert(
        usuarioId: usuarioId,
        campoModificado: "hobby",
        valorAnterior: Value(valorAnterior),
        valorNuevo: Value(valorNuevo),
      ),
    );
  }

  /// Obtener historial de cambios del usuario
  Future<List<HistorialPerfil>> obtenerHistorial(int usuarioId) {
    return (select(historialPerfils)
      ..where((tbl) => tbl.usuarioId.equals(usuarioId))
      ..orderBy([(t) => OrderingTerm.desc(t.fecha)]))
        .get();
  }

  /// Buscar respuesta por palabra clave (corrigiendo `respuestaTexto`)
  Future<String> buscarRespuestaPorKeyword(
      int usuarioId, String keyword) async {
    final result = await (select(respuestas)
      ..where((r) =>
      r.usuarioId.equals(usuarioId) &
      r.respuestaTexto.isNotNull() &
      r.respuestaTexto.like('%$keyword%')))
        .get();

    if (result.isEmpty) return "";

    return result.first.respuestaTexto ?? "";
  }
}
