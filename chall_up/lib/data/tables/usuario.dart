import 'package:drift/drift.dart';

class Usuarios extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().withLength(min: 1, max: 100)();
  TextColumn get correo => text().withLength(min: 1, max: 150).unique()();
  TextColumn get telefono => text().nullable().withLength(min: 0, max: 20)();
  TextColumn get password => text().withLength(min: 1, max: 255)();
  TextColumn get googleId => text().nullable().withLength(min: 0, max: 150)();
  DateTimeColumn get fechaRegistro => dateTime().withDefault(currentDateAndTime)();
} 