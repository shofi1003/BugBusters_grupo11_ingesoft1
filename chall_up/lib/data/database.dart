  import 'dart:io';
  import 'package:drift/drift.dart';
  import 'package:drift/native.dart';
  import 'package:path_provider/path_provider.dart';
  import 'package:path/path.dart' as p;

  import 'tables/usuario.dart';
  import 'tables/rol.dart';
  import 'tables/usuario_rol.dart';
  import 'tables/cuestionario.dart';
  import 'tables/pregunta.dart';
  import 'tables/respuesta.dart';
  import 'tables/perfil.dart';
  import 'tables/historial_perfil.dart';
  import 'tables/reto_predefinido.dart';
  import 'tables/reto_diario.dart';
  import 'tables/reto_global.dart';
  import 'tables/validacion_reto_global.dart';
  import 'tables/evidencia.dart';
  import 'tables/puntuacion.dart';
  import 'tables/ranking.dart';
  import 'tables/notificacion.dart';
  import 'daos/usuario_dao.dart';
  import 'daos/stats_dao.dart';

  part 'database.g.dart';

@DriftDatabase(
  tables: [
    Usuarios,
    Rols,
    UsuarioRols,
    Cuestionarios,
    Preguntas,
    Respuestas,
    Perfils,
    HistorialPerfils,
    RetoPredefinidos,
    RetoDiarios,
    RetoGlobals,
    ValidacionRetoGlobals,
    Evidencias,
    Puntuacions,
    Rankings,
    Notificacions,
  ],
  daos: [
    UsuarioDao,
    StatsDao,
  ],
)
class AppDatabase extends _$AppDatabase {

  AppDatabase._internal() : super(_openConnection());
  static final AppDatabase _instance = AppDatabase._internal();
  factory AppDatabase() => _instance;

  AppDatabase.forTest(QueryExecutor executor) : super(executor);
  
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
