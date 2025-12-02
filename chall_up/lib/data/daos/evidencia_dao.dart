// lib/data/daos/evidencia_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/evidencia.dart';

part 'evidencia_dao.g.dart';

@DriftAccessor(tables: [Evidencias])
class EvidenciaDao extends DatabaseAccessor<AppDatabase>
    with _$EvidenciaDaoMixin {
  EvidenciaDao(AppDatabase db) : super(db);

  /// Guarda una evidencia asociada a un reto diario
  Future<void> guardarEvidencia({
    required int usuarioId,
    required int retoDiarioId,
    required String imagenPath,
  }) async {
    await into(evidencias).insert(
      EvidenciasCompanion.insert(
        usuarioId: usuarioId,
        retoDiarioId: retoDiarioId,
        imagenPath: imagenPath,
      ),
    );
  }

  /// Obtiene todas las evidencias del usuario
  Future<List<Evidencia>> obtenerEvidenciasUsuario(int usuarioId) {
    return (select(evidencias)
      ..where((tbl) => tbl.usuarioId.equals(usuarioId))
      ..orderBy([(t) => OrderingTerm.desc(t.fechaSubida)]))
        .get();
  }
}
