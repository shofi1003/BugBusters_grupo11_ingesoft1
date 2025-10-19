import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;
  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('challup.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Usuario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        correo TEXT UNIQUE NOT NULL,
        telefono TEXT,
        contrasena TEXT NOT NULL,
        google_id TEXT,
        fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
      );
    ''');

    await db.execute('''
      CREATE TABLE Rol (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE UsuarioRol (
        usuario_id INTEGER,
        rol_id INTEGER,
        UNIQUE(usuario_id, rol_id),
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id) ON DELETE CASCADE,
        FOREIGN KEY (rol_id) REFERENCES Rol(id) ON DELETE CASCADE
      );
    ''');

    await db.execute('''
      CREATE TABLE Cuestionario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Pregunta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        cuestionario_id INTEGER,
        texto TEXT NOT NULL,
        tipo TEXT,
        FOREIGN KEY (cuestionario_id) REFERENCES Cuestionario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Respuesta (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        pregunta_id INTEGER,
        usuario_id INTEGER,
        respuesta_texto TEXT,
        fecha_respuesta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (pregunta_id) REFERENCES Pregunta(id),
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Perfil (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER UNIQUE,
        hobbies TEXT,
        habitos TEXT,
        metas TEXT,
        fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE HistorialPerfil (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        campo_modificado TEXT,
        valor_anterior TEXT,
        valor_nuevo TEXT,
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE RetoPredefinido (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        categoria TEXT,
        descripcion TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE RetoDiario (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        reto_predefinido_id INTEGER,
        fecha DATE,
        completado BOOLEAN,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
        FOREIGN KEY (reto_predefinido_id) REFERENCES RetoPredefinido(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE RetoGlobal (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        creador_id INTEGER,
        descripcion TEXT,
        fecha_publicacion DATE,
        aprobado BOOLEAN,
        FOREIGN KEY (creador_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE ValidacionRetoGlobal (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        reto_global_id INTEGER,
        moderador_id INTEGER,
        estado TEXT,
        fecha_validacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (reto_global_id) REFERENCES RetoGlobal(id),
        FOREIGN KEY (moderador_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Evidencia (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        reto_diario_id INTEGER,
        reto_global_id INTEGER,
        tipo TEXT,
        contenido TEXT,
        fecha_subida TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
        FOREIGN KEY (reto_diario_id) REFERENCES RetoDiario(id),
        FOREIGN KEY (reto_global_id) REFERENCES RetoGlobal(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Puntuacion (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER UNIQUE,
        puntos INTEGER,
        racha INTEGER,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Ranking (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER UNIQUE,
        puntos_totales INTEGER,
        posicion INTEGER,
        fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
      );
    ''');

    await db.execute('''
      CREATE TABLE Notificacion (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        usuario_id INTEGER,
        tipo TEXT,
        mensaje TEXT,
        fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        leida BOOLEAN,
        FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
      );
    ''');

    await db.insert('Rol', {'nombre': 'Usuario'});
    await db.insert('Rol', {'nombre': 'Moderador'});
  }

  Future<int> insertarUsuario(Map<String, dynamic> usuario) async {
    final db = await instance.database;
    return await db.insert('Usuario', usuario);
  }

  Future<Map<String, dynamic>?> login(String correo, String contrasena) async {
    final db = await instance.database;
    final res = await db.query(
      'Usuario',
      where: 'correo = ?',
      whereArgs: [correo],
    );

    if (res.isNotEmpty) {
      final storedHash = res.first['contrasena'];
      final inputHash = sha256.convert(utf8.encode(contrasena)).toString();

      if (storedHash == inputHash) {
        return res.first;
      }
    }
    return null;
  }

  Future<List<Map<String, dynamic>>> obtenerUsuarios() async {
    final db = await instance.database;
    return await db.query('Usuario');
  }

  Future<void> eliminarTodo() async {
    final db = await instance.database;
    await db.delete('Usuario');
    await db.delete('Rol');
    await db.delete('UsuarioRol');
    await db.delete('Cuestionario');
    await db.delete('Pregunta');
    await db.delete('Respuesta');
    await db.delete('Perfil');
    await db.delete('HistorialPerfil');
    await db.delete('RetoPredefinido');
    await db.delete('RetoDiario');
    await db.delete('RetoGlobal');
    await db.delete('ValidacionRetoGlobal');
    await db.delete('Evidencia');
    await db.delete('Puntuacion');
    await db.delete('Ranking');
    await db.delete('Notificacion');
  }
}
