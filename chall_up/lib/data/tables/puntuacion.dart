import 'package:drift/drift.dart';
import 'usuario.dart';

class Puntuacions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id).unique()();
  IntColumn get puntos => integer().withDefault(const Constant(0))();
  IntColumn get racha => integer().withDefault(const Constant(0))();
}
