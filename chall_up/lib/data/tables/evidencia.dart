import 'package:drift/drift.dart';
import 'usuario.dart';
import 'reto_diario.dart';
import 'reto_global.dart';

class Evidencias extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  IntColumn get retoDiarioId => integer().nullable().references(RetoDiarios, #id)();
  IntColumn get retoGlobalId => integer().nullable().references(RetoGlobals, #id)();
  TextColumn get tipo => text().withLength(min: 1, max: 20)();
  TextColumn get contenido => text().nullable()();
  DateTimeColumn get fechaSubida => dateTime().withDefault(currentDateAndTime)();
}
