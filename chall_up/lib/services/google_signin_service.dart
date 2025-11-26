import 'package:google_sign_in/google_sign_in.dart';
import '../data/daos/usuario_dao.dart';
import '../utils/hash_helper.dart';
import '../data/database.dart';
import 'package:drift/drift.dart';

class GoogleSignInService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
    clientId: "288008572912-eo7446dgo9tjv2hm9aaebjh72s9pnndp.apps.googleusercontent.com",
  );

  final UsuarioDao usuarioDao;
  Usuario? _usuarioLogueado;

  GoogleSignInService(this.usuarioDao);

 
  Usuario? get usuarioLogueado => _usuarioLogueado;

  Future<String> signIn() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) return "Proceso cancelado";

      final googleId = account.id;
      final correo = account.email;
      final nombre = account.displayName ?? "Usuario Google";

   
      Usuario? usuario = await usuarioDao.obtenerUsuarioPorGoogleId(googleId);

      if (usuario == null) {

        final nuevoUsuario = UsuariosCompanion.insert(
          nombre: nombre,
          correo: correo,
          googleId: Value(googleId),
          password: HashHelper.hashPassword(googleId),
          fechaRegistro: Value(DateTime.now()),
        );

        await usuarioDao.insertarUsuario(nuevoUsuario);
        usuario = await usuarioDao.obtenerUsuarioPorGoogleId(googleId);
      }

      _usuarioLogueado = usuario;
      return "Inicio de sesión con Google exitoso";

    } catch (e) {
      return "Error: $e";
    }
  }

  Future<void> signOut() async {
    _usuarioLogueado = null;
    await _googleSignIn.signOut();
  }
}
