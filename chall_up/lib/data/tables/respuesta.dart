import 'package:drift/drift.dart';
import 'pregunta.dart';
import 'usuario.dart';

class Respuestas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get preguntaId => integer().references(Preguntas, #id)();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  TextColumn get respuestaTexto => text().nullable()();
  DateTimeColumn get fechaRespuesta => dateTime().withDefault(currentDateAndTime)();
}