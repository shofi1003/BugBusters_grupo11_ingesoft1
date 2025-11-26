import 'database.dart';

class DatabaseProvider {
  static AppDatabase? _db;

  static AppDatabase get db {
    _db ??= AppDatabase();
    return _db!;
  }
}
