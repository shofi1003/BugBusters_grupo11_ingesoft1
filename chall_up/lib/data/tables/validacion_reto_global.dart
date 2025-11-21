import 'package:drift/drift.dart';
import 'reto_global.dart';
import 'usuario.dart';

class ValidacionRetoGlobals extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get retoGlobalId => integer().references(RetoGlobals, #id)();
  IntColumn get moderadorId => integer().references(Usuarios, #id)();
  TextColumn get estado => text().withLength(min: 1, max: 20)();
  DateTimeColumn get fechaValidacion => dateTime().withDefault(currentDateAndTime)();
}