import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/usuario.dart';

part 'usuario_dao.g.dart';

@DriftAccessor(tables: [Usuarios])
class UsuarioDao extends DatabaseAccessor<AppDatabase>
    with _$UsuarioDaoMixin {
      
  UsuarioDao(AppDatabase db) : super(db);

  // =====================================================
  // ================ MÉTODOS CRUD BÁSICOS ===============
  // =====================================================

  Future<List<Usuario>> obtenerTodosUsuarios() {
    return select(usuarios).get();
  }

  Future<Usuario?> obtenerUsuarioPorCorreo(String correo) {
    return (select(usuarios)
          ..where((tbl) => tbl.correo.equals(correo)))
        .getSingleOrNull();
  }

  Future<Usuario?> obtenerUsuarioPorGoogleId(String googleId) {
    return (select(usuarios)
          ..where((tbl) => tbl.googleId.equals(googleId)))
        .getSingleOrNull();
  }

  Future<int> insertarUsuario(UsuariosCompanion usuario) {
    return into(usuarios).insert(usuario);
  }

  Future<int> actualizarUsuario(UsuariosCompanion usuario) {
    return into(usuarios).insertOnConflictUpdate(usuario);
  }

  Future<Usuario?> obtenerUsuarioPorId(int id) {
    return (select(usuarios)
          ..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  // =====================================================
  // ============= ACTUALIZACIÓN PARCIAL =================
  // =====================================================
  //
  // SOLO actualiza campos presentes (nombre, teléfono, password)
  // NO toca valores null (Value.absent evita overwrite)
  //
  Future<bool> actualizarUsuarioParcial({
  required int id,
  String? nombre,
  String? telefono,
  String? password,
}) async {
  final companion = UsuariosCompanion(
    nombre: nombre != null ? Value(nombre) : const Value.absent(),
    telefono: telefono != null ? Value(telefono) : const Value.absent(),
    password: password != null ? Value(password) : const Value.absent(),
  );

  // write() devuelve un int, así que lo convertimos a bool
  final filasActualizadas = await (update(usuarios)
        ..where((u) => u.id.equals(id)))
      .write(companion);

  return filasActualizadas > 0; // <- ahora devuelve bool correctamente
}
}