import 'package:drift/drift.dart';
import 'usuario.dart';
import 'reto_diario.dart';
import 'reto_global.dart';

class Evidencias extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  IntColumn get retoDiarioId => integer().references(RetoDiarios, #id)();
  TextColumn get tipoEvidencia => text().withDefault(const Constant('foto'))();
  TextColumn get imagenPath => text().nullable()();
  TextColumn get contenidoTexto => text().nullable()();
  DateTimeColumn get fechaSubida => dateTime().withDefault(currentDateAndTime)();
}
