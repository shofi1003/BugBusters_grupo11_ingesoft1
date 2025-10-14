import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'chall_up.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    // Tabla de usuarios
    await db.execute('''
      CREATE TABLE usuarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        imagen_base64 TEXT
      )
    ''');

    // Ranking (uno a uno con usuario)
    await db.execute('''
      CREATE TABLE ranking (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER NOT NULL,
        puntos INTEGER DEFAULT 0,
        nivel TEXT,
        FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE
      )
    ''');

    // Cuestionarios
    await db.execute('''
      CREATE TABLE cuestionarios (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT NOT NULL,
        descripcion TEXT
      )
    ''');

    // Preguntas (relación muchos a uno con cuestionario)
    await db.execute('''
      CREATE TABLE preguntas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cuestionario_id INTEGER NOT NULL,
        texto TEXT NOT NULL,
        tipo TEXT,
        FOREIGN KEY (cuestionario_id) REFERENCES cuestionarios (id) ON DELETE CASCADE
      )
    ''');
  }

  // ================= FUNCIONES DE USUARIO =================

  Future<int> insertUsuario(String nombre, String email, [String? imagenBase64]) async {
    final dbClient = await db;
    return await dbClient.insert('usuarios', {
      'nombre': nombre,
      'email': email,
      'imagen_base64': imagenBase64,
    });
  }

  Future<List<Map<String, dynamic>>> getUsuarios() async {
    final dbClient = await db;
    return await dbClient.query('usuarios');
  }

  static String imagenToBase64(List<int> bytes) => base64Encode(bytes);
  static List<int> base64ToImagen(String base64) => base64Decode(base64);
}
