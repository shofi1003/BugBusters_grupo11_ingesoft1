import 'package:drift/drift.dart';
import 'usuario.dart';
import 'rol.dart';

class UsuarioRols extends Table {
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  IntColumn get rolId => integer().references(Rols, #id)();

  @override
  Set<Column> get primaryKey => {usuarioId, rolId};
}