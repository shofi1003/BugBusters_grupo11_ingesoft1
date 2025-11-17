// lib/data/daos/perfil_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/perfil.dart';
import '../tables/historial_perfil.dart';

part 'perfil_dao.g.dart';

@DriftAccessor(tables: [Perfils, HistorialPerfils])
class PerfilDao extends DatabaseAccessor<AppDatabase>
    with _$PerfilDaoMixin {
  PerfilDao(AppDatabase db) : super(db);

  Future<Perfil?> obtenerPerfilPorUsuario(int usuarioId) {
    return (select(perfils)..where((p) => p.usuarioId.equals(usuarioId)))
        .getSingleOrNull();
  }

  Future<int> crearPerfil({
    required int usuarioId,
    required String hobbies,
    required String habitos,
    required String metas,
  }) {
    return into(perfils).insert(
      PerfilsCompanion.insert(
        usuarioId: usuarioId,
        hobbies: Value(hobbies),
        habitos: Value(habitos),
        metas: Value(metas),
      ),
    );
  }

  Future<void> actualizarPerfilYGuardarHistorial({
    required int usuarioId,
    String? hobbies,
    String? habitos,
    String? metas,
  }) async {
    final perfilActual = await obtenerPerfilPorUsuario(usuarioId);
    if (perfilActual == null) return;

    // Guardar historial solo de lo que cambia
    if (hobbies != null && hobbies != perfilActual.hobbies) {
      await into(historialPerfils).insert(
        HistorialPerfilsCompanion.insert(
          usuarioId: usuarioId,
          campoModificado: 'hobbies',
          valorAnterior: Value(perfilActual.hobbies),
          valorNuevo: Value(hobbies),
        ),
      );
    }

    if (habitos != null && habitos != perfilActual.habitos) {
      await into(historialPerfils).insert(
        HistorialPerfilsCompanion.insert(
          usuarioId: usuarioId,
          campoModificado: 'habitos',
          valorAnterior: Value(perfilActual.habitos),
          valorNuevo: Value(habitos),
        ),
      );
    }

    if (metas != null && metas != perfilActual.metas) {
      await into(historialPerfils).insert(
        HistorialPerfilsCompanion.insert(
          usuarioId: usuarioId,
          campoModificado: 'metas',
          valorAnterior: Value(perfilActual.metas),
          valorNuevo: Value(metas),
        ),
      );
    }

    await (update(perfils)..where((p) => p.usuarioId.equals(usuarioId))).write(
      PerfilsCompanion(
        hobbies: hobbies != null ? Value(hobbies) : const Value.absent(),
        habitos: habitos != null ? Value(habitos) : const Value.absent(),
        metas: metas != null ? Value(metas) : const Value.absent(),
        fechaActualizacion: Value(DateTime.now()),
      ),
    );
  }

  Future<void> crearOActualizarPerfil({
    required int usuarioId,
    required String hobbies,
    required String habitos,
    required String metas,
  }) async {
    final existe = await obtenerPerfilPorUsuario(usuarioId);
    if (existe == null) {
      await crearPerfil(
        usuarioId: usuarioId,
        hobbies: hobbies,
        habitos: habitos,
        metas: metas,
      );
    } else {
      await actualizarPerfilYGuardarHistorial(
        usuarioId: usuarioId,
        hobbies: hobbies,
        habitos: habitos,
        metas: metas,
      );
    }
  }
}
