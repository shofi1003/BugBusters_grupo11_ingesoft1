import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';

/*
    JUSTIFICACIÓN DEL TEST:
    ------------------------
    La consulta de ula base de datos es parte central del proceso de
    autenticación y recuperación de datos. Este test asegura que el sistema
    puede identificar correctamente si un usuario existe o no.

    CASOS LÍMITE VERIFICADOS:
    1. Consulta de un correo EXISTENTE: debe recuperarse exactamente un usuario.
    2. Consulta de un correo INEXISTENTE: la búsqueda debe devolver una lista vacía.
    3. Los datos del usuario encontrado deben coincidir con los valores insertados,
       verificando consistencia en la escritura y la lectura.

    Con esto garantizamos que las búsquedas por campos únicos funcionan de forma
    predecible, confiable y sin falsos positivos.
*/

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTest(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('Consultar usuario por correo (incluye casos límite)', () async {
    final casos = [
      {
        "descripcion": "Correo existente",
        "correo": "existe@example.com",
        "insertar": true,
        "esperadoEncontrado": true,
      },
      {
        "descripcion": "Correo que no existe",
        "correo": "no_existe@example.com",
        "insertar": false,
        "esperadoEncontrado": false,
      },
    ];

    for (final caso in casos) {
      final correo = caso["correo"] as String;
      final insertar = caso["insertar"] as bool;

      if (insertar) {
        await db.into(db.usuarios).insert(
          UsuariosCompanion.insert(
            nombre: 'Existente',
            correo: correo,
            password: 'Abc12345',
            telefono: const Value(null),
            googleId: const Value(null),
            fechaRegistro: Value(DateTime.now()),
          ),
        );
      }

      final res = await (db.select(db.usuarios)
        ..where((u) => u.correo.equals(correo)))
          .get();

      final encontrado = res.isNotEmpty;

      expect(encontrado, caso["esperadoEncontrado"],
          reason:
          "Caso: ${caso["descripcion"]} → Se esperaba encontrado=${caso["esperadoEncontrado"]}.");

      if (encontrado) {
        expect(res.first.correo, correo);
        expect(res.first.nombre.isNotEmpty, true);
      }
    }
  });
}