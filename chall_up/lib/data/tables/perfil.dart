import 'package:drift/drift.dart';
import 'usuario.dart';

class Perfils extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id).unique()();
  TextColumn get hobbies => text().nullable()();
  TextColumn get habitos => text().nullable()();
  TextColumn get metas => text().nullable()();
  DateTimeColumn get fechaActualizacion => dateTime().withDefault(currentDateAndTime)();
}