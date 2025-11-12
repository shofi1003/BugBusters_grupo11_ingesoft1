import 'package:drift/drift.dart';
import 'usuario.dart';

class HistorialPerfils extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  TextColumn get campoModificado => text().withLength(min: 1, max: 50)();
  TextColumn get valorAnterior => text().nullable()();
  TextColumn get valorNuevo => text().nullable()();
  DateTimeColumn get fecha => dateTime().withDefault(currentDateAndTime)();
}