import 'package:drift/drift.dart';
import 'usuario.dart';

class RetoGlobals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get creadorId => integer().references(Usuarios, #id)();
  TextColumn get descripcion => text()();
  DateTimeColumn get fechaPublicacion => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get aprobado => boolean().withDefault(const Constant(false))();
}