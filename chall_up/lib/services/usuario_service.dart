import 'package:drift/drift.dart';
import '../data/daos/usuario_dao.dart';
import '../utils/hash_helper.dart';
import '../utils/validators.dart';
import '../data/database.dart';

class UsuarioService {
  final UsuarioDao usuarioDao;

  UsuarioService(this.usuarioDao);


  Future<String> registrarUsuario({
    required String nombre,
    required String correo,
    required String password,
  }) async {


    if (!Validators.isValidEmail(correo)) {
      return 'Correo inválido';
    }

    if (!Validators.isValidPassword(password)) {
      return 'La contraseña debe tener al menos 8 caracteres, una mayúscula y un número';
    }

    final Usuario? existe = await usuarioDao.obtenerUsuarioPorCorreo(correo);
    if (existe != null) {
      return 'El correo ya está registrado';
    }

    final hashed = HashHelper.hashPassword(password);

    final usuario = UsuariosCompanion.insert(
      nombre: nombre,
      correo: correo,
      password: hashed,
      fechaRegistro: Value(DateTime.now()),
    );

    await usuarioDao.insertarUsuario(usuario);
    return 'Usuario registrado exitosamente';
  }


  Future<String> iniciarSesion(String correo, String password) async {
    final Usuario? usuario = await usuarioDao.obtenerUsuarioPorCorreo(correo);
    if (usuario == null) return 'Usuario no encontrado';

    final hashed = HashHelper.hashPassword(password);

    return usuario.password == hashed
        ? 'Inicio de sesión exitoso'
        : 'Credenciales incorrectas';
  }


  Future<String> registrarConGoogle(
      String nombre, String correo, String googleId) async {

    final Usuario? existeGoogle =
        await usuarioDao.obtenerUsuarioPorGoogleId(googleId);
    if (existeGoogle != null) return 'Ya existe una cuenta con Google';

    final randomPass = HashHelper.hashPassword(
      DateTime.now().millisecondsSinceEpoch.toString(),
    );

    final usuario = UsuariosCompanion.insert(
      nombre: nombre,
      correo: correo,
      googleId: Value(googleId),
      password: randomPass,
      fechaRegistro: Value(DateTime.now()),
    );

    await usuarioDao.insertarUsuario(usuario);
    return 'Usuario registrado con Google exitosamente';
  }


  Future<String> actualizarPerfil({
    required int usuarioId,
    required String nuevoNombre,
    String? telefono,
  }) async {
    await usuarioDao.actualizarUsuario(
      UsuariosCompanion(
        id: Value(usuarioId),
        nombre: Value(nuevoNombre),
        telefono: telefono != null ? Value(telefono) : const Value.absent(),
      ),
    );

    return 'Perfil actualizado correctamente';
  }
}
