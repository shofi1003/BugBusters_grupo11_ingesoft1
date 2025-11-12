import 'package:drift/drift.dart';
import 'usuario.dart';
import 'reto_predefinido.dart';

class RetoDiarios extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get usuarioId => integer().references(Usuarios, #id)();
  IntColumn get retoPredefinidoId => integer().references(RetoPredefinidos, #id)();
  DateTimeColumn get fecha => dateTime()();
  BoolColumn get completado => boolean().withDefault(const Constant(false))();
}