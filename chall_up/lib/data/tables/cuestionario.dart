import 'package:drift/drift.dart';
import 'usuario.dart';

class Cuestionarios extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  DateTimeColumn get fechaCreacion => dateTime().withDefault(currentDateAndTime)();
}