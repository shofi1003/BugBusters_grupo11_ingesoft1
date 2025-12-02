import 'package:drift/drift.dart';
import 'usuario.dart';
import 'reto_diario.dart';
import 'reto_global.dart';

class Evidencias extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  IntColumn get retoDiarioId => integer().references(RetoDiarios, #id)();
  TextColumn get imagenPath => text()(); // Ruta de la imagen guardada
  DateTimeColumn get fechaSubida => dateTime().withDefault(currentDateAndTime)();
}

