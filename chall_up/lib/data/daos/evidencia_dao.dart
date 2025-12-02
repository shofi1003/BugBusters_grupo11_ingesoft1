// lib/data/daos/evidencia_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/evidencia.dart';
import '../tables/puntuacion.dart';


part 'evidencia_dao.g.dart';

@DriftAccessor(tables: [Evidencias, Puntuacions])
class EvidenciaDao extends DatabaseAccessor<AppDatabase>
    with _$EvidenciaDaoMixin {
  EvidenciaDao(AppDatabase db) : super(db);

  /// Guarda una evidencia asociada a un reto diario y agrega puntos
  Future<void> guardarEvidencia({
    required int usuarioId,
    required int retoDiarioId,
    required String tipoEvidencia,
    String? imagenPath,
    String? contenidoTexto,
  }) async {
    await into(evidencias).insert(
      EvidenciasCompanion.insert(
        usuarioId: usuarioId,
        retoDiarioId: retoDiarioId,
        tipoEvidencia: Value(tipoEvidencia),
        imagenPath: Value(imagenPath),
        contenidoTexto: Value(contenidoTexto),
      ),
    );

    // Agregar puntos según tipo
    int puntos;
    switch (tipoEvidencia) {
      case 'foto':
        puntos = 10;
        break;
      case 'texto':
        puntos = 7;
        break;
      case 'check':
        puntos = 5;
        break;
      default:
        puntos = 0;
    }

    await agregarPuntos(usuarioId, puntos);
  }

  Future<void> agregarPuntos(int usuarioId, int puntosAgregados) async {
    final actual = await (select(puntuacions)..where((t) => t.usuarioId.equals(usuarioId))).getSingleOrNull();
    final nuevosPuntos = (actual?.puntos ?? 0) + puntosAgregados;
    await into(puntuacions).insertOnConflictUpdate(
      PuntuacionsCompanion(
        usuarioId: Value(usuarioId),
        puntos: Value(nuevosPuntos),
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