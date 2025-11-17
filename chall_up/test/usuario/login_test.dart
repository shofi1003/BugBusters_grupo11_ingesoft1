import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:chall_up/data/daos/usuario_dao.dart';
import 'package:chall_up/services/usuario_service.dart';
import 'package:chall_up/utils/hash_helper.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase db;
  late UsuarioDao usuarioDao;
  late UsuarioService usuarioService;

  setUp(() {
    db = AppDatabase.forTest(NativeDatabase.memory());
    usuarioDao = UsuarioDao(db);
    usuarioService = UsuarioService(usuarioDao);
  });

  tearDown(() async {
    await db.close();
  });

  test('Login correcto con credenciales válidas', () async {
    final correo = "login@test.com";
    final password = "Hola1234";
    final hashed = HashHelper.hashPassword(password);

    await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Test User",
        correo: correo,
        password: hashed,
      ),
    );

    final result = await usuarioService.iniciarSesion(correo, password);
    expect(result, 'Inicio de sesión exitoso');
  });

  test('Login falla con contraseña incorrecta', () async {
    final correo = "user@test.com";
    final password = "Hola1234";
    final hashed = HashHelper.hashPassword(password);

    await usuarioDao.insertarUsuario(
      UsuariosCompanion.insert(
        nombre: "Usuario",
        correo: correo,
        password: hashed,
      ),
    );

    final result = await usuarioService.iniciarSesion(correo, "ClaveIncorrecta1");
    expect(result, 'Credenciales incorrectas');
  });

  test('Login falla si el correo no está registrado', () async {
    final result = await usuarioService.iniciarSesion("no_existe@mail.com", "Hola1234");
    expect(result, 'Usuario no encontrado');
  });
}
