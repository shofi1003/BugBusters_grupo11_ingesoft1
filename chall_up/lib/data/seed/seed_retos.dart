import '../../ui/reto/retos_por_hobby.dart';
import '../database.dart';


class RetoSeeder {
  final AppDatabase db;

  RetoSeeder(this.db);

  Future<void> poblarRetos() async {
    for (final entry in retosPorHobby.entries) {
      final hobby = entry.key;
      final lista = entry.value;

      for (final r in lista) {
        await db.into(db.retoPredefinidos).insert(
          RetoPredefinidosCompanion.insert(
            descripcion: r,
            categoria: hobby,
          ),
        );
      }
    }
  }
}
