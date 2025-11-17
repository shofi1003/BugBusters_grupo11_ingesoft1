import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:chall_up/data/daos/usuario_dao.dart';
import 'package:chall_up/utils/validators.dart';
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

  test('Registrar usuario correctamente', () async {
    final nombre = "Usuario";
    final correo = "test@challup.com";
    final password = "Hola1234";

    expect(Validators.isValidName(nombre), true);
    expect(Validators.isValidEmail(correo), true);
    expect(Validators.isValidPassword(password), true);

    final hashed = HashHelper.hashPassword(password);

    final usuarioId = await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: nombre,
        correo: correo,
        password: hashed,
      ),
    );

    expect(usuarioId, isNonZero);
  });

  test('No permite registrar correo duplicado', () async {
    final hashed = HashHelper.hashPassword("Hola1234");

    await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Prueba2",
        correo: "fail@challup.com",
        password: hashed,
      ),
    );

    expect(
      () async {
        await usuarioDao.insertarUsuario(
          UsuariosCompanion.insert(
            nombre: "Prueba3",
            correo: "fail@challup.com",
            password: hashed,
          ),
        );
      },
      throwsException,
    );
  });

  test('Validaciones fallan correctamente', () {
    expect(Validators.isValidEmail("correo_malo"), false);
    expect(Validators.isValidPassword("malo"), false);
    expect(Validators.isValidName("A"), false);
  });
}
