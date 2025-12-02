import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/usuario.dart';
import '../tables/puntuacion.dart';
import '../tables/reto_diario.dart';
import '../tables/ranking.dart';
import '../tables/rol.dart';
import '../tables/usuario_rol.dart';

part 'stats_dao.g.dart';

@DriftAccessor(tables: [
  Usuarios,
  Puntuacions,
  RetoDiarios,
  Rankings,
  Rols,
  UsuarioRols
])
class StatsDao extends DatabaseAccessor<AppDatabase> with _$StatsDaoMixin {
  StatsDao(AppDatabase db) : super(db);

  // 1. Get Points and Streak
  // Drift automatically converts "Puntuacions" table -> "Puntuacion" data class
  Future<Puntuacion?> obtenerPuntuacionUsuario(int usuarioId) {
    return (select(puntuacions)..where((t) => t.usuarioId.equals(usuarioId))).getSingleOrNull();
  }

  // 2. Count Total Completed Challenges
  Future<int> contarRetosCompletados(int usuarioId) async {
    final countExp = retoDiarios.id.count();

    final query = selectOnly(retoDiarios)
      ..addColumns([countExp])
      ..where(retoDiarios.usuarioId.equals(usuarioId) &
      retoDiarios.completado.equals(true));

    final result = await query.map((row) => row.read(countExp)).getSingle();
    return result ?? 0;
  }

  // 3. Weekly Progress (Last 7 days)
  Future<double> obtenerProgresoSemanal(int usuarioId) async {
    final now = DateTime.now();
    final sevenDaysAgo = DateTime(now.year, now.month, now.day).subtract(const Duration(days: 7));

    final countExp = retoDiarios.id.count();

    final query = selectOnly(retoDiarios)
      ..addColumns([countExp])
      ..where(retoDiarios.usuarioId.equals(usuarioId) &
      retoDiarios.completado.equals(true) &
      retoDiarios.fecha.isBiggerOrEqualValue(sevenDaysAgo));

    final completedCount = await query.map((row) => row.read(countExp)).getSingle();
    final safeCount = completedCount ?? 0;

    // Returns percentage (0.0 to 1.0) assuming 7 challenges/week
    return (safeCount / 7).clamp(0.0, 1.0);
  }

  // 4. Top 5 Ranking
  Future<List<TypedResult>> obtenerTopRanking() async {
    final query = select(rankings).join([
      innerJoin(usuarios, usuarios.id.equalsExp(rankings.usuarioId))
    ])
      ..orderBy([OrderingTerm(expression: rankings.puntosTotales, mode: OrderingMode.desc)])
      ..limit(5);

    return await query.get();
  }

  // 5. Check if Admin
  Future<bool> esAdmin(int usuarioId) async {
    final query = select(usuarioRols).join([
      innerJoin(rols, rols.id.equalsExp(usuarioRols.rolId))
    ])..where(usuarioRols.usuarioId.equals(usuarioId) & rols.nombre.equals('admin'));

    final result = await query.get();
    return result.isNotEmpty;
  }

  // 6. Admin Stats: Total Users
  Future<int> contarTotalUsuarios() async {
    final countExp = usuarios.id.count();
    final result = await (selectOnly(usuarios)..addColumns([countExp])).getSingle();
    return result.read(countExp) ?? 0;
  }
}