import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:chall_up/data/daos/usuario_dao.dart';
import 'package:chall_up/utils/hash_helper.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase db;
  late UsuarioDao usuarioDao;

  setUp(() {
    db = AppDatabase.forTest(NativeDatabase.memory());
    usuarioDao = UsuarioDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('Actualizar nombre, teléfono y contraseña del usuario', () async {
    final usuarioId = await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Usuario Inicial",
        correo: "usuario@test.com",
        password: HashHelper.hashPassword("Password123"),
      ),
    );

    expect(usuarioId, isNonZero);

    final nuevoNombre = "Usuario Actualizado";
    final nuevoTelefono = "1234567890";
    final nuevaPassword = "NuevaPass123";

    final ok = await usuarioDao.actualizarUsuarioParcial(
      id: usuarioId,
      nombre: nuevoNombre,
      telefono: nuevoTelefono,
      password: HashHelper.hashPassword(nuevaPassword),
    );

    expect(ok, true);

    final usuarioActualizado = await usuarioDao.obtenerUsuarioPorId(usuarioId);

    expect(usuarioActualizado, isNotNull);
    expect(usuarioActualizado!.nombre, nuevoNombre);
    expect(usuarioActualizado.telefono, nuevoTelefono);
    expect(usuarioActualizado.password, HashHelper.hashPassword(nuevaPassword));
  });

  test('Actualizar solo nombre del usuario', () async {
    final usuarioId = await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Usuario Inicial",
        correo: "usuario2@test.com",
        password: HashHelper.hashPassword("Password123"),
      ),
    );

    expect(usuarioId, isNonZero);

    final nuevoNombre = "Nombre Solo Actualizado";

    final ok = await usuarioDao.actualizarUsuarioParcial(
      id: usuarioId,
      nombre: nuevoNombre,
      telefono: null,
      password: null,
    );

    expect(ok, true);


    final usuarioActualizado = await usuarioDao.obtenerUsuarioPorId(usuarioId);

    expect(usuarioActualizado, isNotNull);
    expect(usuarioActualizado!.nombre, nuevoNombre);
    expect(usuarioActualizado.telefono, isNull);
    expect(usuarioActualizado.password, HashHelper.hashPassword("Password123"));
  });
}
