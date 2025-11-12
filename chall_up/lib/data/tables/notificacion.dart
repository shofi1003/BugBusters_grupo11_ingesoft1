import 'package:drift/drift.dart';
import 'usuario.dart';

class Notificacions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  TextColumn get tipo => text().withLength(min: 1, max: 50)();
  TextColumn get mensaje => text()();
  DateTimeColumn get fecha => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get leida => boolean().withDefault(const Constant(false))();
}