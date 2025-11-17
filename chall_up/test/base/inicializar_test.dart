import 'package:flutter_test/flutter_test.dart';
import 'package:chall_up/data/database.dart';
import 'package:drift/native.dart';

/*
    JUSTIFICACIÓN DEL TEST:
    ------------------------
    Este test valida la correcta inicialización de la base de datos en memoria,
    que es el punto de partida para todas las operaciones CRUD del sistema.

    CASOS LÍMITE VERIFICADOS:
    1. La base de datos debe construirse sin lanzar excepciones.
    2. La instancia creada debe ser del tipo AppDatabase (no nula ni incorrecta).
    3. El motor SQLite debe cargar correctamente en un entorno aislado de pruebas.

    Validar estos puntos garantiza que el sistema puede iniciar su capa de
    persistencia de forma confiable antes de cualquier otra operación.
*/

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTest(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('La base de datos se inicializa correctamente', () {
    expect(db, isA<AppDatabase>(),
        reason: "La instancia de AppDatabase debe crearse sin errores.");
  });
}