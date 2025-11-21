import 'package:drift/drift.dart';
import 'cuestionario.dart';

class Preguntas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cuestionarioId => integer().references(Cuestionarios, #id)();
  TextColumn get texto => text().withLength(min: 1, max: 255)();
  TextColumn get tipo => text().withLength(min: 1, max: 50)();
}