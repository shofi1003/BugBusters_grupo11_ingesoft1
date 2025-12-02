import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/evidencia.dart';
import '../tables/reto_predefinido.dart';
import '../tables/reto_diario.dart';
import '../tables/perfil.dart';

part 'historial_retos_dao.g.dart';

class RetoCompletadoConDetalle {
  final Evidencia evidencia;
  final RetoDiario retoDiario;
  final RetoPredefinido retoBase;
  final Perfil perfil;

  RetoCompletadoConDetalle({
    required this.evidencia,
    required this.retoDiario,
    required this.retoBase,
    required this.perfil,
  });
}

@DriftAccessor(
  tables: [Evidencias, RetoDiarios, RetoPredefinidos, Perfils],
)
class HistorialRetosDao extends DatabaseAccessor<AppDatabase>
    with _$HistorialRetosDaoMixin {
  HistorialRetosDao(AppDatabase db) : super(db);

  Future<List<RetoCompletadoConDetalle>> obtenerHistorial(int usuarioId) async {
    final query = await (select(evidencias)
      ..where((e) => e.usuarioId.equals(usuarioId))
      ..orderBy([(e) => OrderingTerm.desc(e.fechaSubida)]))
        .get();

    List<RetoCompletadoConDetalle> lista = [];

    for (final ev in query) {
      final reto = await (select(retoDiarios)
        ..where((r) => r.id.equals(ev.retoDiarioId)))
          .getSingle();

      final base = await (select(retoPredefinidos)
        ..where((b) => b.id.equals(reto.retoPredefinidoId)))
          .getSingle();

      final perfil = await (select(perfils)
        ..where((p) => p.usuarioId.equals(usuarioId)))
          .getSingle();

      lista.add(RetoCompletadoConDetalle(
        evidencia: ev,
        retoDiario: reto,
        retoBase: base,
        perfil: perfil,
      ));
    }

    return lista;
  }
}
