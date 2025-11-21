import 'package:drift/drift.dart';
import 'usuario.dart';

class Rankings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id).unique()();
  IntColumn get puntosTotales => integer().withDefault(const Constant(0))();
  IntColumn get posicion => integer().withDefault(const Constant(0))();
  DateTimeColumn get fechaActualizacion => dateTime().withDefault(currentDateAndTime)();
}