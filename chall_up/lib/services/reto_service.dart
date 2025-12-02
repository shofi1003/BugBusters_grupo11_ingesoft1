import '../ui/reto/retos_por_hobby.dart';
import '../data/database.dart';

class RetoService {
  final AppDatabase db;

  RetoService(this.db);

  /// Obtiene el reto de HOY sin repetir
  Future<String> obtenerRetoDiario(int usuarioId, String hobby) async {
    final hoy = DateTime.now();
    final fechaHoy = DateTime(hoy.year, hoy.month, hoy.day);

    // 1) Verificar si ya existe un reto hoy
    final retoHoy = await (db.select(db.retoDiarios)
      ..where((tbl) => tbl.usuarioId.equals(usuarioId))
      ..where((tbl) => tbl.fecha.equals(fechaHoy)))
        .getSingleOrNull();

    if (retoHoy != null) {
      // Cargar desde reto predefinido
      final reto = await (db.select(db.retoPredefinidos)
        ..where((tbl) => tbl.id.equals(retoHoy.retoPredefinidoId)))
          .getSingle();
      return reto.descripcion;
    }

    // 2) Obtener TODOS los retos disponibles del hobby
    final listaRetos = retosPorHobby[hobby] ?? [];

    // 3) Obtener retos ya usados por el usuario
    final usados = await (db.select(db.retoDiarios)
      ..where((tbl) => tbl.usuarioId.equals(usuarioId)))
        .get();

    final usadosIds = usados.map((r) => r.retoPredefinidoId).toSet();

    // 4) Obtener IDs reales de la tabla retos_predefinidos
    final retosDB = await db.select(db.retoPredefinidos).get();

    // 5) Filtrar retos del hobby
    final retosHobbyDB =
    retosDB.where((r) => r.categoria == hobby).toList();

    // 6) Encontrar los no usados
    final disponibles =
    retosHobbyDB.where((r) => !usadosIds.contains(r.id)).toList();

    // Si ya usó todos → reiniciar
    final seleccionPool = disponibles.isEmpty ? retosHobbyDB : disponibles;

    // Elegir uno aleatorio
    seleccionPool.shuffle();
    final elegido = seleccionPool.first;

    // Guardarlo como reto diario
    await db.into(db.retoDiarios).insert(
      RetoDiariosCompanion.insert(
        usuarioId: usuarioId,
        retoPredefinidoId: elegido.id,
        fecha: fechaHoy,
      ),
    );

    return elegido.descripcion;
  }
}
