import 'package:drift/drift.dart';

class RetoPredefinidos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoria => text().withLength(min: 1, max: 50)();
  TextColumn get descripcion => text().withLength(min: 1, max: 200)();
}