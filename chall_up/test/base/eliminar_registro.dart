import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';

/*
    JUSTIFICACIÓN DEL TEST:
    ------------------------
    El manejo correcto del borrado de registros es esencial para mantener la
    integridad y consistencia de los datos. Este test garantiza que la base de
    datos responde adecuadamente ante operaciones DELETE.

    CASOS LÍMITE VERIFICADOS:
    1. Eliminación exitosa de un registro existente.
    2. Intento de eliminar un ID inexistente: no debe eliminar ninguna fila.
    3. Intento de eliminar DOS veces el mismo ID: la primera eliminación es válida,
       la segunda debe devolver "0 filas afectadas" sin generar errores.

    Esto asegura que la base de datos maneja correctamente escenarios reales,
    evita inconsistencias y previene fallos silenciosos o inesperados.
*/

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTest(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('Eliminar registro de una tabla (caso general con casos límite)', () async {

    final id = await db.into(db.usuarios).insert(
      UsuariosCompanion.insert(
        nombre: "Persona",
        correo: "persona@example.com",
        password: "hola12345",
        telefono: const Value(null),
        googleId: const Value(null),
        fechaRegistro: Value(DateTime.now()),
      ),
    );

    final casos = [
      {
        "descripcion": "Eliminar un registro existente",
        "userId": id,
        "esperado": true,
      },
      {
        "descripcion": "Intentar eliminar un registro inexistente",
        "userId": -1,
        "esperado": false,
      },
      {
        "descripcion": "Eliminar dos veces el mismo registro",
        "userId": id,
        "esperado": false,
      },
    ];

    for (final caso in casos) {
      final userId = caso["userId"] as int;

      final filasAfectadas = await (db.delete(db.usuarios)
        ..where((tbl) => tbl.id.equals(userId)))
          .go();

      final resultado = filasAfectadas > 0;

      expect(
        resultado,
        caso["esperado"],
        reason:
        "Caso: ${caso["descripcion"]} — Se esperaba ${caso["esperado"]} al eliminar userId=$userId",
      );
    }
  });
}
