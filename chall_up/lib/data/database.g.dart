// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsuariosTable extends Usuarios with TableInfo<$UsuariosTable, Usuario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _correoMeta = const VerificationMeta('correo');
  @override
  late final GeneratedColumn<String> correo = GeneratedColumn<String>(
    'correo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _googleIdMeta = const VerificationMeta(
    'googleId',
  );
  @override
  late final GeneratedColumn<String> googleId = GeneratedColumn<String>(
    'google_id',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaRegistroMeta = const VerificationMeta(
    'fechaRegistro',
  );
  @override
  late final GeneratedColumn<DateTime> fechaRegistro =
      GeneratedColumn<DateTime>(
        'fecha_registro',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nombre,
    correo,
    telefono,
    password,
    googleId,
    fechaRegistro,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuarios';
  @override
  VerificationContext validateIntegrity(
    Insertable<Usuario> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('correo')) {
      context.handle(
        _correoMeta,
        correo.isAcceptableOrUnknown(data['correo']!, _correoMeta),
      );
    } else if (isInserting) {
      context.missing(_correoMeta);
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('google_id')) {
      context.handle(
        _googleIdMeta,
        googleId.isAcceptableOrUnknown(data['google_id']!, _googleIdMeta),
      );
    }
    if (data.containsKey('fecha_registro')) {
      context.handle(
        _fechaRegistroMeta,
        fechaRegistro.isAcceptableOrUnknown(
          data['fecha_registro']!,
          _fechaRegistroMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Usuario(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      correo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}correo'],
      )!,
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      ),
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      googleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}google_id'],
      ),
      fechaRegistro: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_registro'],
      )!,
    );
  }

  @override
  $UsuariosTable createAlias(String alias) {
    return $UsuariosTable(attachedDatabase, alias);
  }
}

class Usuario extends DataClass implements Insertable<Usuario> {
  final int id;
  final String nombre;
  final String correo;
  final String? telefono;
  final String password;
  final String? googleId;
  final DateTime fechaRegistro;
  const Usuario({
    required this.id,
    required this.nombre,
    required this.correo,
    this.telefono,
    required this.password,
    this.googleId,
    required this.fechaRegistro,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    map['correo'] = Variable<String>(correo);
    if (!nullToAbsent || telefono != null) {
      map['telefono'] = Variable<String>(telefono);
    }
    map['password'] = Variable<String>(password);
    if (!nullToAbsent || googleId != null) {
      map['google_id'] = Variable<String>(googleId);
    }
    map['fecha_registro'] = Variable<DateTime>(fechaRegistro);
    return map;
  }

  UsuariosCompanion toCompanion(bool nullToAbsent) {
    return UsuariosCompanion(
      id: Value(id),
      nombre: Value(nombre),
      correo: Value(correo),
      telefono: telefono == null && nullToAbsent
          ? const Value.absent()
          : Value(telefono),
      password: Value(password),
      googleId: googleId == null && nullToAbsent
          ? const Value.absent()
          : Value(googleId),
      fechaRegistro: Value(fechaRegistro),
    );
  }

  factory Usuario.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Usuario(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
      correo: serializer.fromJson<String>(json['correo']),
      telefono: serializer.fromJson<String?>(json['telefono']),
      password: serializer.fromJson<String>(json['password']),
      googleId: serializer.fromJson<String?>(json['googleId']),
      fechaRegistro: serializer.fromJson<DateTime>(json['fechaRegistro']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
      'correo': serializer.toJson<String>(correo),
      'telefono': serializer.toJson<String?>(telefono),
      'password': serializer.toJson<String>(password),
      'googleId': serializer.toJson<String?>(googleId),
      'fechaRegistro': serializer.toJson<DateTime>(fechaRegistro),
    };
  }

  Usuario copyWith({
    int? id,
    String? nombre,
    String? correo,
    Value<String?> telefono = const Value.absent(),
    String? password,
    Value<String?> googleId = const Value.absent(),
    DateTime? fechaRegistro,
  }) => Usuario(
    id: id ?? this.id,
    nombre: nombre ?? this.nombre,
    correo: correo ?? this.correo,
    telefono: telefono.present ? telefono.value : this.telefono,
    password: password ?? this.password,
    googleId: googleId.present ? googleId.value : this.googleId,
    fechaRegistro: fechaRegistro ?? this.fechaRegistro,
  );
  Usuario copyWithCompanion(UsuariosCompanion data) {
    return Usuario(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      correo: data.correo.present ? data.correo.value : this.correo,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      password: data.password.present ? data.password.value : this.password,
      googleId: data.googleId.present ? data.googleId.value : this.googleId,
      fechaRegistro: data.fechaRegistro.present
          ? data.fechaRegistro.value
          : this.fechaRegistro,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Usuario(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('correo: $correo, ')
          ..write('telefono: $telefono, ')
          ..write('password: $password, ')
          ..write('googleId: $googleId, ')
          ..write('fechaRegistro: $fechaRegistro')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    nombre,
    correo,
    telefono,
    password,
    googleId,
    fechaRegistro,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          other.id == this.id &&
          other.nombre == this.nombre &&
          other.correo == this.correo &&
          other.telefono == this.telefono &&
          other.password == this.password &&
          other.googleId == this.googleId &&
          other.fechaRegistro == this.fechaRegistro);
}

class UsuariosCompanion extends UpdateCompanion<Usuario> {
  final Value<int> id;
  final Value<String> nombre;
  final Value<String> correo;
  final Value<String?> telefono;
  final Value<String> password;
  final Value<String?> googleId;
  final Value<DateTime> fechaRegistro;
  const UsuariosCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
    this.correo = const Value.absent(),
    this.telefono = const Value.absent(),
    this.password = const Value.absent(),
    this.googleId = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
  });
  UsuariosCompanion.insert({
    this.id = const Value.absent(),
    required String nombre,
    required String correo,
    this.telefono = const Value.absent(),
    required String password,
    this.googleId = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
  }) : nombre = Value(nombre),
       correo = Value(correo),
       password = Value(password);
  static Insertable<Usuario> custom({
    Expression<int>? id,
    Expression<String>? nombre,
    Expression<String>? correo,
    Expression<String>? telefono,
    Expression<String>? password,
    Expression<String>? googleId,
    Expression<DateTime>? fechaRegistro,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
      if (correo != null) 'correo': correo,
      if (telefono != null) 'telefono': telefono,
      if (password != null) 'password': password,
      if (googleId != null) 'google_id': googleId,
      if (fechaRegistro != null) 'fecha_registro': fechaRegistro,
    });
  }

  UsuariosCompanion copyWith({
    Value<int>? id,
    Value<String>? nombre,
    Value<String>? correo,
    Value<String?>? telefono,
    Value<String>? password,
    Value<String?>? googleId,
    Value<DateTime>? fechaRegistro,
  }) {
    return UsuariosCompanion(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      correo: correo ?? this.correo,
      telefono: telefono ?? this.telefono,
      password: password ?? this.password,
      googleId: googleId ?? this.googleId,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (correo.present) {
      map['correo'] = Variable<String>(correo.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (googleId.present) {
      map['google_id'] = Variable<String>(googleId.value);
    }
    if (fechaRegistro.present) {
      map['fecha_registro'] = Variable<DateTime>(fechaRegistro.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre, ')
          ..write('correo: $correo, ')
          ..write('telefono: $telefono, ')
          ..write('password: $password, ')
          ..write('googleId: $googleId, ')
          ..write('fechaRegistro: $fechaRegistro')
          ..write(')'))
        .toString();
  }
}

class $RolsTable extends Rols with TableInfo<$RolsTable, Rol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nombre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rols';
  @override
  VerificationContext validateIntegrity(
    Insertable<Rol> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Rol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Rol(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
    );
  }

  @override
  $RolsTable createAlias(String alias) {
    return $RolsTable(attachedDatabase, alias);
  }
}

class Rol extends DataClass implements Insertable<Rol> {
  final int id;
  final String nombre;
  const Rol({required this.id, required this.nombre});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nombre'] = Variable<String>(nombre);
    return map;
  }

  RolsCompanion toCompanion(bool nullToAbsent) {
    return RolsCompanion(id: Value(id), nombre: Value(nombre));
  }

  factory Rol.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Rol(
      id: serializer.fromJson<int>(json['id']),
      nombre: serializer.fromJson<String>(json['nombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nombre': serializer.toJson<String>(nombre),
    };
  }

  Rol copyWith({int? id, String? nombre}) =>
      Rol(id: id ?? this.id, nombre: nombre ?? this.nombre);
  Rol copyWithCompanion(RolsCompanion data) {
    return Rol(
      id: data.id.present ? data.id.value : this.id,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Rol(')
          ..write('id: $id, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nombre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Rol && other.id == this.id && other.nombre == this.nombre);
}

class RolsCompanion extends UpdateCompanion<Rol> {
  final Value<int> id;
  final Value<String> nombre;
  const RolsCompanion({
    this.id = const Value.absent(),
    this.nombre = const Value.absent(),
  });
  RolsCompanion.insert({this.id = const Value.absent(), required String nombre})
    : nombre = Value(nombre);
  static Insertable<Rol> custom({
    Expression<int>? id,
    Expression<String>? nombre,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nombre != null) 'nombre': nombre,
    });
  }

  RolsCompanion copyWith({Value<int>? id, Value<String>? nombre}) {
    return RolsCompanion(id: id ?? this.id, nombre: nombre ?? this.nombre);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RolsCompanion(')
          ..write('id: $id, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }
}

class $UsuarioRolsTable extends UsuarioRols
    with TableInfo<$UsuarioRolsTable, UsuarioRol> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsuarioRolsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _rolIdMeta = const VerificationMeta('rolId');
  @override
  late final GeneratedColumn<int> rolId = GeneratedColumn<int>(
    'rol_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rols (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [usuarioId, rolId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'usuario_rols';
  @override
  VerificationContext validateIntegrity(
    Insertable<UsuarioRol> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('rol_id')) {
      context.handle(
        _rolIdMeta,
        rolId.isAcceptableOrUnknown(data['rol_id']!, _rolIdMeta),
      );
    } else if (isInserting) {
      context.missing(_rolIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {usuarioId, rolId};
  @override
  UsuarioRol map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsuarioRol(
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      rolId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}rol_id'],
      )!,
    );
  }

  @override
  $UsuarioRolsTable createAlias(String alias) {
    return $UsuarioRolsTable(attachedDatabase, alias);
  }
}

class UsuarioRol extends DataClass implements Insertable<UsuarioRol> {
  final int usuarioId;
  final int rolId;
  const UsuarioRol({required this.usuarioId, required this.rolId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['usuario_id'] = Variable<int>(usuarioId);
    map['rol_id'] = Variable<int>(rolId);
    return map;
  }

  UsuarioRolsCompanion toCompanion(bool nullToAbsent) {
    return UsuarioRolsCompanion(
      usuarioId: Value(usuarioId),
      rolId: Value(rolId),
    );
  }

  factory UsuarioRol.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsuarioRol(
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      rolId: serializer.fromJson<int>(json['rolId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'usuarioId': serializer.toJson<int>(usuarioId),
      'rolId': serializer.toJson<int>(rolId),
    };
  }

  UsuarioRol copyWith({int? usuarioId, int? rolId}) => UsuarioRol(
    usuarioId: usuarioId ?? this.usuarioId,
    rolId: rolId ?? this.rolId,
  );
  UsuarioRol copyWithCompanion(UsuarioRolsCompanion data) {
    return UsuarioRol(
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      rolId: data.rolId.present ? data.rolId.value : this.rolId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioRol(')
          ..write('usuarioId: $usuarioId, ')
          ..write('rolId: $rolId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(usuarioId, rolId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsuarioRol &&
          other.usuarioId == this.usuarioId &&
          other.rolId == this.rolId);
}

class UsuarioRolsCompanion extends UpdateCompanion<UsuarioRol> {
  final Value<int> usuarioId;
  final Value<int> rolId;
  final Value<int> rowid;
  const UsuarioRolsCompanion({
    this.usuarioId = const Value.absent(),
    this.rolId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsuarioRolsCompanion.insert({
    required int usuarioId,
    required int rolId,
    this.rowid = const Value.absent(),
  }) : usuarioId = Value(usuarioId),
       rolId = Value(rolId);
  static Insertable<UsuarioRol> custom({
    Expression<int>? usuarioId,
    Expression<int>? rolId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (rolId != null) 'rol_id': rolId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsuarioRolsCompanion copyWith({
    Value<int>? usuarioId,
    Value<int>? rolId,
    Value<int>? rowid,
  }) {
    return UsuarioRolsCompanion(
      usuarioId: usuarioId ?? this.usuarioId,
      rolId: rolId ?? this.rolId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (rolId.present) {
      map['rol_id'] = Variable<int>(rolId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuarioRolsCompanion(')
          ..write('usuarioId: $usuarioId, ')
          ..write('rolId: $rolId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuestionariosTable extends Cuestionarios
    with TableInfo<$CuestionariosTable, Cuestionario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuestionariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _fechaCreacionMeta = const VerificationMeta(
    'fechaCreacion',
  );
  @override
  late final GeneratedColumn<DateTime> fechaCreacion =
      GeneratedColumn<DateTime>(
        'fecha_creacion',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [id, usuarioId, fechaCreacion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuestionarios';
  @override
  VerificationContext validateIntegrity(
    Insertable<Cuestionario> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('fecha_creacion')) {
      context.handle(
        _fechaCreacionMeta,
        fechaCreacion.isAcceptableOrUnknown(
          data['fecha_creacion']!,
          _fechaCreacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cuestionario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cuestionario(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      fechaCreacion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_creacion'],
      )!,
    );
  }

  @override
  $CuestionariosTable createAlias(String alias) {
    return $CuestionariosTable(attachedDatabase, alias);
  }
}

class Cuestionario extends DataClass implements Insertable<Cuestionario> {
  final int id;
  final int usuarioId;
  final DateTime fechaCreacion;
  const Cuestionario({
    required this.id,
    required this.usuarioId,
    required this.fechaCreacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    map['fecha_creacion'] = Variable<DateTime>(fechaCreacion);
    return map;
  }

  CuestionariosCompanion toCompanion(bool nullToAbsent) {
    return CuestionariosCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      fechaCreacion: Value(fechaCreacion),
    );
  }

  factory Cuestionario.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cuestionario(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      fechaCreacion: serializer.fromJson<DateTime>(json['fechaCreacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'fechaCreacion': serializer.toJson<DateTime>(fechaCreacion),
    };
  }

  Cuestionario copyWith({int? id, int? usuarioId, DateTime? fechaCreacion}) =>
      Cuestionario(
        id: id ?? this.id,
        usuarioId: usuarioId ?? this.usuarioId,
        fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      );
  Cuestionario copyWithCompanion(CuestionariosCompanion data) {
    return Cuestionario(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      fechaCreacion: data.fechaCreacion.present
          ? data.fechaCreacion.value
          : this.fechaCreacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cuestionario(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('fechaCreacion: $fechaCreacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, usuarioId, fechaCreacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cuestionario &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.fechaCreacion == this.fechaCreacion);
}

class CuestionariosCompanion extends UpdateCompanion<Cuestionario> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<DateTime> fechaCreacion;
  const CuestionariosCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.fechaCreacion = const Value.absent(),
  });
  CuestionariosCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    this.fechaCreacion = const Value.absent(),
  }) : usuarioId = Value(usuarioId);
  static Insertable<Cuestionario> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<DateTime>? fechaCreacion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (fechaCreacion != null) 'fecha_creacion': fechaCreacion,
    });
  }

  CuestionariosCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<DateTime>? fechaCreacion,
  }) {
    return CuestionariosCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (fechaCreacion.present) {
      map['fecha_creacion'] = Variable<DateTime>(fechaCreacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuestionariosCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('fechaCreacion: $fechaCreacion')
          ..write(')'))
        .toString();
  }
}

class $PreguntasTable extends Preguntas
    with TableInfo<$PreguntasTable, Pregunta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreguntasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _cuestionarioIdMeta = const VerificationMeta(
    'cuestionarioId',
  );
  @override
  late final GeneratedColumn<int> cuestionarioId = GeneratedColumn<int>(
    'cuestionario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cuestionarios (id)',
    ),
  );
  static const VerificationMeta _textoMeta = const VerificationMeta('texto');
  @override
  late final GeneratedColumn<String> texto = GeneratedColumn<String>(
    'texto',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, cuestionarioId, texto, tipo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'preguntas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pregunta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('cuestionario_id')) {
      context.handle(
        _cuestionarioIdMeta,
        cuestionarioId.isAcceptableOrUnknown(
          data['cuestionario_id']!,
          _cuestionarioIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cuestionarioIdMeta);
    }
    if (data.containsKey('texto')) {
      context.handle(
        _textoMeta,
        texto.isAcceptableOrUnknown(data['texto']!, _textoMeta),
      );
    } else if (isInserting) {
      context.missing(_textoMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pregunta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pregunta(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      cuestionarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cuestionario_id'],
      )!,
      texto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}texto'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
    );
  }

  @override
  $PreguntasTable createAlias(String alias) {
    return $PreguntasTable(attachedDatabase, alias);
  }
}

class Pregunta extends DataClass implements Insertable<Pregunta> {
  final int id;
  final int cuestionarioId;
  final String texto;
  final String tipo;
  const Pregunta({
    required this.id,
    required this.cuestionarioId,
    required this.texto,
    required this.tipo,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['cuestionario_id'] = Variable<int>(cuestionarioId);
    map['texto'] = Variable<String>(texto);
    map['tipo'] = Variable<String>(tipo);
    return map;
  }

  PreguntasCompanion toCompanion(bool nullToAbsent) {
    return PreguntasCompanion(
      id: Value(id),
      cuestionarioId: Value(cuestionarioId),
      texto: Value(texto),
      tipo: Value(tipo),
    );
  }

  factory Pregunta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pregunta(
      id: serializer.fromJson<int>(json['id']),
      cuestionarioId: serializer.fromJson<int>(json['cuestionarioId']),
      texto: serializer.fromJson<String>(json['texto']),
      tipo: serializer.fromJson<String>(json['tipo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'cuestionarioId': serializer.toJson<int>(cuestionarioId),
      'texto': serializer.toJson<String>(texto),
      'tipo': serializer.toJson<String>(tipo),
    };
  }

  Pregunta copyWith({
    int? id,
    int? cuestionarioId,
    String? texto,
    String? tipo,
  }) => Pregunta(
    id: id ?? this.id,
    cuestionarioId: cuestionarioId ?? this.cuestionarioId,
    texto: texto ?? this.texto,
    tipo: tipo ?? this.tipo,
  );
  Pregunta copyWithCompanion(PreguntasCompanion data) {
    return Pregunta(
      id: data.id.present ? data.id.value : this.id,
      cuestionarioId: data.cuestionarioId.present
          ? data.cuestionarioId.value
          : this.cuestionarioId,
      texto: data.texto.present ? data.texto.value : this.texto,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pregunta(')
          ..write('id: $id, ')
          ..write('cuestionarioId: $cuestionarioId, ')
          ..write('texto: $texto, ')
          ..write('tipo: $tipo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, cuestionarioId, texto, tipo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pregunta &&
          other.id == this.id &&
          other.cuestionarioId == this.cuestionarioId &&
          other.texto == this.texto &&
          other.tipo == this.tipo);
}

class PreguntasCompanion extends UpdateCompanion<Pregunta> {
  final Value<int> id;
  final Value<int> cuestionarioId;
  final Value<String> texto;
  final Value<String> tipo;
  const PreguntasCompanion({
    this.id = const Value.absent(),
    this.cuestionarioId = const Value.absent(),
    this.texto = const Value.absent(),
    this.tipo = const Value.absent(),
  });
  PreguntasCompanion.insert({
    this.id = const Value.absent(),
    required int cuestionarioId,
    required String texto,
    required String tipo,
  }) : cuestionarioId = Value(cuestionarioId),
       texto = Value(texto),
       tipo = Value(tipo);
  static Insertable<Pregunta> custom({
    Expression<int>? id,
    Expression<int>? cuestionarioId,
    Expression<String>? texto,
    Expression<String>? tipo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (cuestionarioId != null) 'cuestionario_id': cuestionarioId,
      if (texto != null) 'texto': texto,
      if (tipo != null) 'tipo': tipo,
    });
  }

  PreguntasCompanion copyWith({
    Value<int>? id,
    Value<int>? cuestionarioId,
    Value<String>? texto,
    Value<String>? tipo,
  }) {
    return PreguntasCompanion(
      id: id ?? this.id,
      cuestionarioId: cuestionarioId ?? this.cuestionarioId,
      texto: texto ?? this.texto,
      tipo: tipo ?? this.tipo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (cuestionarioId.present) {
      map['cuestionario_id'] = Variable<int>(cuestionarioId.value);
    }
    if (texto.present) {
      map['texto'] = Variable<String>(texto.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreguntasCompanion(')
          ..write('id: $id, ')
          ..write('cuestionarioId: $cuestionarioId, ')
          ..write('texto: $texto, ')
          ..write('tipo: $tipo')
          ..write(')'))
        .toString();
  }
}

class $RespuestasTable extends Respuestas
    with TableInfo<$RespuestasTable, Respuesta> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RespuestasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _preguntaIdMeta = const VerificationMeta(
    'preguntaId',
  );
  @override
  late final GeneratedColumn<int> preguntaId = GeneratedColumn<int>(
    'pregunta_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES preguntas (id)',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _respuestaTextoMeta = const VerificationMeta(
    'respuestaTexto',
  );
  @override
  late final GeneratedColumn<String> respuestaTexto = GeneratedColumn<String>(
    'respuesta_texto',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaRespuestaMeta = const VerificationMeta(
    'fechaRespuesta',
  );
  @override
  late final GeneratedColumn<DateTime> fechaRespuesta =
      GeneratedColumn<DateTime>(
        'fecha_respuesta',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    preguntaId,
    usuarioId,
    respuestaTexto,
    fechaRespuesta,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'respuestas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Respuesta> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pregunta_id')) {
      context.handle(
        _preguntaIdMeta,
        preguntaId.isAcceptableOrUnknown(data['pregunta_id']!, _preguntaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_preguntaIdMeta);
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('respuesta_texto')) {
      context.handle(
        _respuestaTextoMeta,
        respuestaTexto.isAcceptableOrUnknown(
          data['respuesta_texto']!,
          _respuestaTextoMeta,
        ),
      );
    }
    if (data.containsKey('fecha_respuesta')) {
      context.handle(
        _fechaRespuestaMeta,
        fechaRespuesta.isAcceptableOrUnknown(
          data['fecha_respuesta']!,
          _fechaRespuestaMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Respuesta map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Respuesta(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      preguntaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pregunta_id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      respuestaTexto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}respuesta_texto'],
      ),
      fechaRespuesta: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_respuesta'],
      )!,
    );
  }

  @override
  $RespuestasTable createAlias(String alias) {
    return $RespuestasTable(attachedDatabase, alias);
  }
}

class Respuesta extends DataClass implements Insertable<Respuesta> {
  final int id;
  final int preguntaId;
  final int usuarioId;
  final String? respuestaTexto;
  final DateTime fechaRespuesta;
  const Respuesta({
    required this.id,
    required this.preguntaId,
    required this.usuarioId,
    this.respuestaTexto,
    required this.fechaRespuesta,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['pregunta_id'] = Variable<int>(preguntaId);
    map['usuario_id'] = Variable<int>(usuarioId);
    if (!nullToAbsent || respuestaTexto != null) {
      map['respuesta_texto'] = Variable<String>(respuestaTexto);
    }
    map['fecha_respuesta'] = Variable<DateTime>(fechaRespuesta);
    return map;
  }

  RespuestasCompanion toCompanion(bool nullToAbsent) {
    return RespuestasCompanion(
      id: Value(id),
      preguntaId: Value(preguntaId),
      usuarioId: Value(usuarioId),
      respuestaTexto: respuestaTexto == null && nullToAbsent
          ? const Value.absent()
          : Value(respuestaTexto),
      fechaRespuesta: Value(fechaRespuesta),
    );
  }

  factory Respuesta.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Respuesta(
      id: serializer.fromJson<int>(json['id']),
      preguntaId: serializer.fromJson<int>(json['preguntaId']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      respuestaTexto: serializer.fromJson<String?>(json['respuestaTexto']),
      fechaRespuesta: serializer.fromJson<DateTime>(json['fechaRespuesta']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'preguntaId': serializer.toJson<int>(preguntaId),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'respuestaTexto': serializer.toJson<String?>(respuestaTexto),
      'fechaRespuesta': serializer.toJson<DateTime>(fechaRespuesta),
    };
  }

  Respuesta copyWith({
    int? id,
    int? preguntaId,
    int? usuarioId,
    Value<String?> respuestaTexto = const Value.absent(),
    DateTime? fechaRespuesta,
  }) => Respuesta(
    id: id ?? this.id,
    preguntaId: preguntaId ?? this.preguntaId,
    usuarioId: usuarioId ?? this.usuarioId,
    respuestaTexto: respuestaTexto.present
        ? respuestaTexto.value
        : this.respuestaTexto,
    fechaRespuesta: fechaRespuesta ?? this.fechaRespuesta,
  );
  Respuesta copyWithCompanion(RespuestasCompanion data) {
    return Respuesta(
      id: data.id.present ? data.id.value : this.id,
      preguntaId: data.preguntaId.present
          ? data.preguntaId.value
          : this.preguntaId,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      respuestaTexto: data.respuestaTexto.present
          ? data.respuestaTexto.value
          : this.respuestaTexto,
      fechaRespuesta: data.fechaRespuesta.present
          ? data.fechaRespuesta.value
          : this.fechaRespuesta,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Respuesta(')
          ..write('id: $id, ')
          ..write('preguntaId: $preguntaId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('respuestaTexto: $respuestaTexto, ')
          ..write('fechaRespuesta: $fechaRespuesta')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, preguntaId, usuarioId, respuestaTexto, fechaRespuesta);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Respuesta &&
          other.id == this.id &&
          other.preguntaId == this.preguntaId &&
          other.usuarioId == this.usuarioId &&
          other.respuestaTexto == this.respuestaTexto &&
          other.fechaRespuesta == this.fechaRespuesta);
}

class RespuestasCompanion extends UpdateCompanion<Respuesta> {
  final Value<int> id;
  final Value<int> preguntaId;
  final Value<int> usuarioId;
  final Value<String?> respuestaTexto;
  final Value<DateTime> fechaRespuesta;
  const RespuestasCompanion({
    this.id = const Value.absent(),
    this.preguntaId = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.respuestaTexto = const Value.absent(),
    this.fechaRespuesta = const Value.absent(),
  });
  RespuestasCompanion.insert({
    this.id = const Value.absent(),
    required int preguntaId,
    required int usuarioId,
    this.respuestaTexto = const Value.absent(),
    this.fechaRespuesta = const Value.absent(),
  }) : preguntaId = Value(preguntaId),
       usuarioId = Value(usuarioId);
  static Insertable<Respuesta> custom({
    Expression<int>? id,
    Expression<int>? preguntaId,
    Expression<int>? usuarioId,
    Expression<String>? respuestaTexto,
    Expression<DateTime>? fechaRespuesta,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (preguntaId != null) 'pregunta_id': preguntaId,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (respuestaTexto != null) 'respuesta_texto': respuestaTexto,
      if (fechaRespuesta != null) 'fecha_respuesta': fechaRespuesta,
    });
  }

  RespuestasCompanion copyWith({
    Value<int>? id,
    Value<int>? preguntaId,
    Value<int>? usuarioId,
    Value<String?>? respuestaTexto,
    Value<DateTime>? fechaRespuesta,
  }) {
    return RespuestasCompanion(
      id: id ?? this.id,
      preguntaId: preguntaId ?? this.preguntaId,
      usuarioId: usuarioId ?? this.usuarioId,
      respuestaTexto: respuestaTexto ?? this.respuestaTexto,
      fechaRespuesta: fechaRespuesta ?? this.fechaRespuesta,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (preguntaId.present) {
      map['pregunta_id'] = Variable<int>(preguntaId.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (respuestaTexto.present) {
      map['respuesta_texto'] = Variable<String>(respuestaTexto.value);
    }
    if (fechaRespuesta.present) {
      map['fecha_respuesta'] = Variable<DateTime>(fechaRespuesta.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RespuestasCompanion(')
          ..write('id: $id, ')
          ..write('preguntaId: $preguntaId, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('respuestaTexto: $respuestaTexto, ')
          ..write('fechaRespuesta: $fechaRespuesta')
          ..write(')'))
        .toString();
  }
}

class $PerfilsTable extends Perfils with TableInfo<$PerfilsTable, Perfil> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PerfilsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _hobbiesMeta = const VerificationMeta(
    'hobbies',
  );
  @override
  late final GeneratedColumn<String> hobbies = GeneratedColumn<String>(
    'hobbies',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _habitosMeta = const VerificationMeta(
    'habitos',
  );
  @override
  late final GeneratedColumn<String> habitos = GeneratedColumn<String>(
    'habitos',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _metasMeta = const VerificationMeta('metas');
  @override
  late final GeneratedColumn<String> metas = GeneratedColumn<String>(
    'metas',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaActualizacionMeta =
      const VerificationMeta('fechaActualizacion');
  @override
  late final GeneratedColumn<DateTime> fechaActualizacion =
      GeneratedColumn<DateTime>(
        'fecha_actualizacion',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    hobbies,
    habitos,
    metas,
    fechaActualizacion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'perfils';
  @override
  VerificationContext validateIntegrity(
    Insertable<Perfil> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('hobbies')) {
      context.handle(
        _hobbiesMeta,
        hobbies.isAcceptableOrUnknown(data['hobbies']!, _hobbiesMeta),
      );
    }
    if (data.containsKey('habitos')) {
      context.handle(
        _habitosMeta,
        habitos.isAcceptableOrUnknown(data['habitos']!, _habitosMeta),
      );
    }
    if (data.containsKey('metas')) {
      context.handle(
        _metasMeta,
        metas.isAcceptableOrUnknown(data['metas']!, _metasMeta),
      );
    }
    if (data.containsKey('fecha_actualizacion')) {
      context.handle(
        _fechaActualizacionMeta,
        fechaActualizacion.isAcceptableOrUnknown(
          data['fecha_actualizacion']!,
          _fechaActualizacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Perfil map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Perfil(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      hobbies: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hobbies'],
      ),
      habitos: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}habitos'],
      ),
      metas: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}metas'],
      ),
      fechaActualizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_actualizacion'],
      )!,
    );
  }

  @override
  $PerfilsTable createAlias(String alias) {
    return $PerfilsTable(attachedDatabase, alias);
  }
}

class Perfil extends DataClass implements Insertable<Perfil> {
  final int id;
  final int usuarioId;
  final String? hobbies;
  final String? habitos;
  final String? metas;
  final DateTime fechaActualizacion;
  const Perfil({
    required this.id,
    required this.usuarioId,
    this.hobbies,
    this.habitos,
    this.metas,
    required this.fechaActualizacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    if (!nullToAbsent || hobbies != null) {
      map['hobbies'] = Variable<String>(hobbies);
    }
    if (!nullToAbsent || habitos != null) {
      map['habitos'] = Variable<String>(habitos);
    }
    if (!nullToAbsent || metas != null) {
      map['metas'] = Variable<String>(metas);
    }
    map['fecha_actualizacion'] = Variable<DateTime>(fechaActualizacion);
    return map;
  }

  PerfilsCompanion toCompanion(bool nullToAbsent) {
    return PerfilsCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      hobbies: hobbies == null && nullToAbsent
          ? const Value.absent()
          : Value(hobbies),
      habitos: habitos == null && nullToAbsent
          ? const Value.absent()
          : Value(habitos),
      metas: metas == null && nullToAbsent
          ? const Value.absent()
          : Value(metas),
      fechaActualizacion: Value(fechaActualizacion),
    );
  }

  factory Perfil.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Perfil(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      hobbies: serializer.fromJson<String?>(json['hobbies']),
      habitos: serializer.fromJson<String?>(json['habitos']),
      metas: serializer.fromJson<String?>(json['metas']),
      fechaActualizacion: serializer.fromJson<DateTime>(
        json['fechaActualizacion'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'hobbies': serializer.toJson<String?>(hobbies),
      'habitos': serializer.toJson<String?>(habitos),
      'metas': serializer.toJson<String?>(metas),
      'fechaActualizacion': serializer.toJson<DateTime>(fechaActualizacion),
    };
  }

  Perfil copyWith({
    int? id,
    int? usuarioId,
    Value<String?> hobbies = const Value.absent(),
    Value<String?> habitos = const Value.absent(),
    Value<String?> metas = const Value.absent(),
    DateTime? fechaActualizacion,
  }) => Perfil(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    hobbies: hobbies.present ? hobbies.value : this.hobbies,
    habitos: habitos.present ? habitos.value : this.habitos,
    metas: metas.present ? metas.value : this.metas,
    fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
  );
  Perfil copyWithCompanion(PerfilsCompanion data) {
    return Perfil(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      hobbies: data.hobbies.present ? data.hobbies.value : this.hobbies,
      habitos: data.habitos.present ? data.habitos.value : this.habitos,
      metas: data.metas.present ? data.metas.value : this.metas,
      fechaActualizacion: data.fechaActualizacion.present
          ? data.fechaActualizacion.value
          : this.fechaActualizacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Perfil(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('hobbies: $hobbies, ')
          ..write('habitos: $habitos, ')
          ..write('metas: $metas, ')
          ..write('fechaActualizacion: $fechaActualizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, usuarioId, hobbies, habitos, metas, fechaActualizacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Perfil &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.hobbies == this.hobbies &&
          other.habitos == this.habitos &&
          other.metas == this.metas &&
          other.fechaActualizacion == this.fechaActualizacion);
}

class PerfilsCompanion extends UpdateCompanion<Perfil> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<String?> hobbies;
  final Value<String?> habitos;
  final Value<String?> metas;
  final Value<DateTime> fechaActualizacion;
  const PerfilsCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.hobbies = const Value.absent(),
    this.habitos = const Value.absent(),
    this.metas = const Value.absent(),
    this.fechaActualizacion = const Value.absent(),
  });
  PerfilsCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    this.hobbies = const Value.absent(),
    this.habitos = const Value.absent(),
    this.metas = const Value.absent(),
    this.fechaActualizacion = const Value.absent(),
  }) : usuarioId = Value(usuarioId);
  static Insertable<Perfil> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<String>? hobbies,
    Expression<String>? habitos,
    Expression<String>? metas,
    Expression<DateTime>? fechaActualizacion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (hobbies != null) 'hobbies': hobbies,
      if (habitos != null) 'habitos': habitos,
      if (metas != null) 'metas': metas,
      if (fechaActualizacion != null) 'fecha_actualizacion': fechaActualizacion,
    });
  }

  PerfilsCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<String?>? hobbies,
    Value<String?>? habitos,
    Value<String?>? metas,
    Value<DateTime>? fechaActualizacion,
  }) {
    return PerfilsCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      hobbies: hobbies ?? this.hobbies,
      habitos: habitos ?? this.habitos,
      metas: metas ?? this.metas,
      fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (hobbies.present) {
      map['hobbies'] = Variable<String>(hobbies.value);
    }
    if (habitos.present) {
      map['habitos'] = Variable<String>(habitos.value);
    }
    if (metas.present) {
      map['metas'] = Variable<String>(metas.value);
    }
    if (fechaActualizacion.present) {
      map['fecha_actualizacion'] = Variable<DateTime>(fechaActualizacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PerfilsCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('hobbies: $hobbies, ')
          ..write('habitos: $habitos, ')
          ..write('metas: $metas, ')
          ..write('fechaActualizacion: $fechaActualizacion')
          ..write(')'))
        .toString();
  }
}

class $HistorialPerfilsTable extends HistorialPerfils
    with TableInfo<$HistorialPerfilsTable, HistorialPerfil> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistorialPerfilsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _campoModificadoMeta = const VerificationMeta(
    'campoModificado',
  );
  @override
  late final GeneratedColumn<String> campoModificado = GeneratedColumn<String>(
    'campo_modificado',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valorAnteriorMeta = const VerificationMeta(
    'valorAnterior',
  );
  @override
  late final GeneratedColumn<String> valorAnterior = GeneratedColumn<String>(
    'valor_anterior',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _valorNuevoMeta = const VerificationMeta(
    'valorNuevo',
  );
  @override
  late final GeneratedColumn<String> valorNuevo = GeneratedColumn<String>(
    'valor_nuevo',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    campoModificado,
    valorAnterior,
    valorNuevo,
    fecha,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historial_perfils';
  @override
  VerificationContext validateIntegrity(
    Insertable<HistorialPerfil> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('campo_modificado')) {
      context.handle(
        _campoModificadoMeta,
        campoModificado.isAcceptableOrUnknown(
          data['campo_modificado']!,
          _campoModificadoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_campoModificadoMeta);
    }
    if (data.containsKey('valor_anterior')) {
      context.handle(
        _valorAnteriorMeta,
        valorAnterior.isAcceptableOrUnknown(
          data['valor_anterior']!,
          _valorAnteriorMeta,
        ),
      );
    }
    if (data.containsKey('valor_nuevo')) {
      context.handle(
        _valorNuevoMeta,
        valorNuevo.isAcceptableOrUnknown(data['valor_nuevo']!, _valorNuevoMeta),
      );
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HistorialPerfil map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistorialPerfil(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      campoModificado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}campo_modificado'],
      )!,
      valorAnterior: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}valor_anterior'],
      ),
      valorNuevo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}valor_nuevo'],
      ),
      fecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
    );
  }

  @override
  $HistorialPerfilsTable createAlias(String alias) {
    return $HistorialPerfilsTable(attachedDatabase, alias);
  }
}

class HistorialPerfil extends DataClass implements Insertable<HistorialPerfil> {
  final int id;
  final int usuarioId;
  final String campoModificado;
  final String? valorAnterior;
  final String? valorNuevo;
  final DateTime fecha;
  const HistorialPerfil({
    required this.id,
    required this.usuarioId,
    required this.campoModificado,
    this.valorAnterior,
    this.valorNuevo,
    required this.fecha,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    map['campo_modificado'] = Variable<String>(campoModificado);
    if (!nullToAbsent || valorAnterior != null) {
      map['valor_anterior'] = Variable<String>(valorAnterior);
    }
    if (!nullToAbsent || valorNuevo != null) {
      map['valor_nuevo'] = Variable<String>(valorNuevo);
    }
    map['fecha'] = Variable<DateTime>(fecha);
    return map;
  }

  HistorialPerfilsCompanion toCompanion(bool nullToAbsent) {
    return HistorialPerfilsCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      campoModificado: Value(campoModificado),
      valorAnterior: valorAnterior == null && nullToAbsent
          ? const Value.absent()
          : Value(valorAnterior),
      valorNuevo: valorNuevo == null && nullToAbsent
          ? const Value.absent()
          : Value(valorNuevo),
      fecha: Value(fecha),
    );
  }

  factory HistorialPerfil.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistorialPerfil(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      campoModificado: serializer.fromJson<String>(json['campoModificado']),
      valorAnterior: serializer.fromJson<String?>(json['valorAnterior']),
      valorNuevo: serializer.fromJson<String?>(json['valorNuevo']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'campoModificado': serializer.toJson<String>(campoModificado),
      'valorAnterior': serializer.toJson<String?>(valorAnterior),
      'valorNuevo': serializer.toJson<String?>(valorNuevo),
      'fecha': serializer.toJson<DateTime>(fecha),
    };
  }

  HistorialPerfil copyWith({
    int? id,
    int? usuarioId,
    String? campoModificado,
    Value<String?> valorAnterior = const Value.absent(),
    Value<String?> valorNuevo = const Value.absent(),
    DateTime? fecha,
  }) => HistorialPerfil(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    campoModificado: campoModificado ?? this.campoModificado,
    valorAnterior: valorAnterior.present
        ? valorAnterior.value
        : this.valorAnterior,
    valorNuevo: valorNuevo.present ? valorNuevo.value : this.valorNuevo,
    fecha: fecha ?? this.fecha,
  );
  HistorialPerfil copyWithCompanion(HistorialPerfilsCompanion data) {
    return HistorialPerfil(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      campoModificado: data.campoModificado.present
          ? data.campoModificado.value
          : this.campoModificado,
      valorAnterior: data.valorAnterior.present
          ? data.valorAnterior.value
          : this.valorAnterior,
      valorNuevo: data.valorNuevo.present
          ? data.valorNuevo.value
          : this.valorNuevo,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HistorialPerfil(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('campoModificado: $campoModificado, ')
          ..write('valorAnterior: $valorAnterior, ')
          ..write('valorNuevo: $valorNuevo, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    usuarioId,
    campoModificado,
    valorAnterior,
    valorNuevo,
    fecha,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistorialPerfil &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.campoModificado == this.campoModificado &&
          other.valorAnterior == this.valorAnterior &&
          other.valorNuevo == this.valorNuevo &&
          other.fecha == this.fecha);
}

class HistorialPerfilsCompanion extends UpdateCompanion<HistorialPerfil> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<String> campoModificado;
  final Value<String?> valorAnterior;
  final Value<String?> valorNuevo;
  final Value<DateTime> fecha;
  const HistorialPerfilsCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.campoModificado = const Value.absent(),
    this.valorAnterior = const Value.absent(),
    this.valorNuevo = const Value.absent(),
    this.fecha = const Value.absent(),
  });
  HistorialPerfilsCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    required String campoModificado,
    this.valorAnterior = const Value.absent(),
    this.valorNuevo = const Value.absent(),
    this.fecha = const Value.absent(),
  }) : usuarioId = Value(usuarioId),
       campoModificado = Value(campoModificado);
  static Insertable<HistorialPerfil> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<String>? campoModificado,
    Expression<String>? valorAnterior,
    Expression<String>? valorNuevo,
    Expression<DateTime>? fecha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (campoModificado != null) 'campo_modificado': campoModificado,
      if (valorAnterior != null) 'valor_anterior': valorAnterior,
      if (valorNuevo != null) 'valor_nuevo': valorNuevo,
      if (fecha != null) 'fecha': fecha,
    });
  }

  HistorialPerfilsCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<String>? campoModificado,
    Value<String?>? valorAnterior,
    Value<String?>? valorNuevo,
    Value<DateTime>? fecha,
  }) {
    return HistorialPerfilsCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      campoModificado: campoModificado ?? this.campoModificado,
      valorAnterior: valorAnterior ?? this.valorAnterior,
      valorNuevo: valorNuevo ?? this.valorNuevo,
      fecha: fecha ?? this.fecha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (campoModificado.present) {
      map['campo_modificado'] = Variable<String>(campoModificado.value);
    }
    if (valorAnterior.present) {
      map['valor_anterior'] = Variable<String>(valorAnterior.value);
    }
    if (valorNuevo.present) {
      map['valor_nuevo'] = Variable<String>(valorNuevo.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistorialPerfilsCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('campoModificado: $campoModificado, ')
          ..write('valorAnterior: $valorAnterior, ')
          ..write('valorNuevo: $valorNuevo, ')
          ..write('fecha: $fecha')
          ..write(')'))
        .toString();
  }
}

class $RetoPredefinidosTable extends RetoPredefinidos
    with TableInfo<$RetoPredefinidosTable, RetoPredefinido> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RetoPredefinidosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoriaMeta = const VerificationMeta(
    'categoria',
  );
  @override
  late final GeneratedColumn<String> categoria = GeneratedColumn<String>(
    'categoria',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, categoria, descripcion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reto_predefinidos';
  @override
  VerificationContext validateIntegrity(
    Insertable<RetoPredefinido> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('categoria')) {
      context.handle(
        _categoriaMeta,
        categoria.isAcceptableOrUnknown(data['categoria']!, _categoriaMeta),
      );
    } else if (isInserting) {
      context.missing(_categoriaMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RetoPredefinido map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RetoPredefinido(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      categoria: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categoria'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
    );
  }

  @override
  $RetoPredefinidosTable createAlias(String alias) {
    return $RetoPredefinidosTable(attachedDatabase, alias);
  }
}

class RetoPredefinido extends DataClass implements Insertable<RetoPredefinido> {
  final int id;
  final String categoria;
  final String descripcion;
  const RetoPredefinido({
    required this.id,
    required this.categoria,
    required this.descripcion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['categoria'] = Variable<String>(categoria);
    map['descripcion'] = Variable<String>(descripcion);
    return map;
  }

  RetoPredefinidosCompanion toCompanion(bool nullToAbsent) {
    return RetoPredefinidosCompanion(
      id: Value(id),
      categoria: Value(categoria),
      descripcion: Value(descripcion),
    );
  }

  factory RetoPredefinido.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RetoPredefinido(
      id: serializer.fromJson<int>(json['id']),
      categoria: serializer.fromJson<String>(json['categoria']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoria': serializer.toJson<String>(categoria),
      'descripcion': serializer.toJson<String>(descripcion),
    };
  }

  RetoPredefinido copyWith({int? id, String? categoria, String? descripcion}) =>
      RetoPredefinido(
        id: id ?? this.id,
        categoria: categoria ?? this.categoria,
        descripcion: descripcion ?? this.descripcion,
      );
  RetoPredefinido copyWithCompanion(RetoPredefinidosCompanion data) {
    return RetoPredefinido(
      id: data.id.present ? data.id.value : this.id,
      categoria: data.categoria.present ? data.categoria.value : this.categoria,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RetoPredefinido(')
          ..write('id: $id, ')
          ..write('categoria: $categoria, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoria, descripcion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RetoPredefinido &&
          other.id == this.id &&
          other.categoria == this.categoria &&
          other.descripcion == this.descripcion);
}

class RetoPredefinidosCompanion extends UpdateCompanion<RetoPredefinido> {
  final Value<int> id;
  final Value<String> categoria;
  final Value<String> descripcion;
  const RetoPredefinidosCompanion({
    this.id = const Value.absent(),
    this.categoria = const Value.absent(),
    this.descripcion = const Value.absent(),
  });
  RetoPredefinidosCompanion.insert({
    this.id = const Value.absent(),
    required String categoria,
    required String descripcion,
  }) : categoria = Value(categoria),
       descripcion = Value(descripcion);
  static Insertable<RetoPredefinido> custom({
    Expression<int>? id,
    Expression<String>? categoria,
    Expression<String>? descripcion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoria != null) 'categoria': categoria,
      if (descripcion != null) 'descripcion': descripcion,
    });
  }

  RetoPredefinidosCompanion copyWith({
    Value<int>? id,
    Value<String>? categoria,
    Value<String>? descripcion,
  }) {
    return RetoPredefinidosCompanion(
      id: id ?? this.id,
      categoria: categoria ?? this.categoria,
      descripcion: descripcion ?? this.descripcion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoria.present) {
      map['categoria'] = Variable<String>(categoria.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RetoPredefinidosCompanion(')
          ..write('id: $id, ')
          ..write('categoria: $categoria, ')
          ..write('descripcion: $descripcion')
          ..write(')'))
        .toString();
  }
}

class $RetoDiariosTable extends RetoDiarios
    with TableInfo<$RetoDiariosTable, RetoDiario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RetoDiariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _retoPredefinidoIdMeta = const VerificationMeta(
    'retoPredefinidoId',
  );
  @override
  late final GeneratedColumn<int> retoPredefinidoId = GeneratedColumn<int>(
    'reto_predefinido_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reto_predefinidos (id)',
    ),
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completadoMeta = const VerificationMeta(
    'completado',
  );
  @override
  late final GeneratedColumn<bool> completado = GeneratedColumn<bool>(
    'completado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    retoPredefinidoId,
    fecha,
    completado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reto_diarios';
  @override
  VerificationContext validateIntegrity(
    Insertable<RetoDiario> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('reto_predefinido_id')) {
      context.handle(
        _retoPredefinidoIdMeta,
        retoPredefinidoId.isAcceptableOrUnknown(
          data['reto_predefinido_id']!,
          _retoPredefinidoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_retoPredefinidoIdMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    } else if (isInserting) {
      context.missing(_fechaMeta);
    }
    if (data.containsKey('completado')) {
      context.handle(
        _completadoMeta,
        completado.isAcceptableOrUnknown(data['completado']!, _completadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RetoDiario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RetoDiario(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      retoPredefinidoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reto_predefinido_id'],
      )!,
      fecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
      completado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completado'],
      )!,
    );
  }

  @override
  $RetoDiariosTable createAlias(String alias) {
    return $RetoDiariosTable(attachedDatabase, alias);
  }
}

class RetoDiario extends DataClass implements Insertable<RetoDiario> {
  final int id;
  final int usuarioId;
  final int retoPredefinidoId;
  final DateTime fecha;
  final bool completado;
  const RetoDiario({
    required this.id,
    required this.usuarioId,
    required this.retoPredefinidoId,
    required this.fecha,
    required this.completado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    map['reto_predefinido_id'] = Variable<int>(retoPredefinidoId);
    map['fecha'] = Variable<DateTime>(fecha);
    map['completado'] = Variable<bool>(completado);
    return map;
  }

  RetoDiariosCompanion toCompanion(bool nullToAbsent) {
    return RetoDiariosCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      retoPredefinidoId: Value(retoPredefinidoId),
      fecha: Value(fecha),
      completado: Value(completado),
    );
  }

  factory RetoDiario.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RetoDiario(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      retoPredefinidoId: serializer.fromJson<int>(json['retoPredefinidoId']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      completado: serializer.fromJson<bool>(json['completado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'retoPredefinidoId': serializer.toJson<int>(retoPredefinidoId),
      'fecha': serializer.toJson<DateTime>(fecha),
      'completado': serializer.toJson<bool>(completado),
    };
  }

  RetoDiario copyWith({
    int? id,
    int? usuarioId,
    int? retoPredefinidoId,
    DateTime? fecha,
    bool? completado,
  }) => RetoDiario(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    retoPredefinidoId: retoPredefinidoId ?? this.retoPredefinidoId,
    fecha: fecha ?? this.fecha,
    completado: completado ?? this.completado,
  );
  RetoDiario copyWithCompanion(RetoDiariosCompanion data) {
    return RetoDiario(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      retoPredefinidoId: data.retoPredefinidoId.present
          ? data.retoPredefinidoId.value
          : this.retoPredefinidoId,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
      completado: data.completado.present
          ? data.completado.value
          : this.completado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RetoDiario(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('retoPredefinidoId: $retoPredefinidoId, ')
          ..write('fecha: $fecha, ')
          ..write('completado: $completado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, usuarioId, retoPredefinidoId, fecha, completado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RetoDiario &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.retoPredefinidoId == this.retoPredefinidoId &&
          other.fecha == this.fecha &&
          other.completado == this.completado);
}

class RetoDiariosCompanion extends UpdateCompanion<RetoDiario> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<int> retoPredefinidoId;
  final Value<DateTime> fecha;
  final Value<bool> completado;
  const RetoDiariosCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.retoPredefinidoId = const Value.absent(),
    this.fecha = const Value.absent(),
    this.completado = const Value.absent(),
  });
  RetoDiariosCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    required int retoPredefinidoId,
    required DateTime fecha,
    this.completado = const Value.absent(),
  }) : usuarioId = Value(usuarioId),
       retoPredefinidoId = Value(retoPredefinidoId),
       fecha = Value(fecha);
  static Insertable<RetoDiario> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<int>? retoPredefinidoId,
    Expression<DateTime>? fecha,
    Expression<bool>? completado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (retoPredefinidoId != null) 'reto_predefinido_id': retoPredefinidoId,
      if (fecha != null) 'fecha': fecha,
      if (completado != null) 'completado': completado,
    });
  }

  RetoDiariosCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<int>? retoPredefinidoId,
    Value<DateTime>? fecha,
    Value<bool>? completado,
  }) {
    return RetoDiariosCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      retoPredefinidoId: retoPredefinidoId ?? this.retoPredefinidoId,
      fecha: fecha ?? this.fecha,
      completado: completado ?? this.completado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (retoPredefinidoId.present) {
      map['reto_predefinido_id'] = Variable<int>(retoPredefinidoId.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (completado.present) {
      map['completado'] = Variable<bool>(completado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RetoDiariosCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('retoPredefinidoId: $retoPredefinidoId, ')
          ..write('fecha: $fecha, ')
          ..write('completado: $completado')
          ..write(')'))
        .toString();
  }
}

class $RetoGlobalsTable extends RetoGlobals
    with TableInfo<$RetoGlobalsTable, RetoGlobal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RetoGlobalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _creadorIdMeta = const VerificationMeta(
    'creadorId',
  );
  @override
  late final GeneratedColumn<int> creadorId = GeneratedColumn<int>(
    'creador_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaPublicacionMeta = const VerificationMeta(
    'fechaPublicacion',
  );
  @override
  late final GeneratedColumn<DateTime> fechaPublicacion =
      GeneratedColumn<DateTime>(
        'fecha_publicacion',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _aprobadoMeta = const VerificationMeta(
    'aprobado',
  );
  @override
  late final GeneratedColumn<bool> aprobado = GeneratedColumn<bool>(
    'aprobado',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("aprobado" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    creadorId,
    descripcion,
    fechaPublicacion,
    aprobado,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reto_globals';
  @override
  VerificationContext validateIntegrity(
    Insertable<RetoGlobal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('creador_id')) {
      context.handle(
        _creadorIdMeta,
        creadorId.isAcceptableOrUnknown(data['creador_id']!, _creadorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_creadorIdMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('fecha_publicacion')) {
      context.handle(
        _fechaPublicacionMeta,
        fechaPublicacion.isAcceptableOrUnknown(
          data['fecha_publicacion']!,
          _fechaPublicacionMeta,
        ),
      );
    }
    if (data.containsKey('aprobado')) {
      context.handle(
        _aprobadoMeta,
        aprobado.isAcceptableOrUnknown(data['aprobado']!, _aprobadoMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RetoGlobal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RetoGlobal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      creadorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}creador_id'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      fechaPublicacion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_publicacion'],
      )!,
      aprobado: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}aprobado'],
      )!,
    );
  }

  @override
  $RetoGlobalsTable createAlias(String alias) {
    return $RetoGlobalsTable(attachedDatabase, alias);
  }
}

class RetoGlobal extends DataClass implements Insertable<RetoGlobal> {
  final int id;
  final int creadorId;
  final String descripcion;
  final DateTime fechaPublicacion;
  final bool aprobado;
  const RetoGlobal({
    required this.id,
    required this.creadorId,
    required this.descripcion,
    required this.fechaPublicacion,
    required this.aprobado,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['creador_id'] = Variable<int>(creadorId);
    map['descripcion'] = Variable<String>(descripcion);
    map['fecha_publicacion'] = Variable<DateTime>(fechaPublicacion);
    map['aprobado'] = Variable<bool>(aprobado);
    return map;
  }

  RetoGlobalsCompanion toCompanion(bool nullToAbsent) {
    return RetoGlobalsCompanion(
      id: Value(id),
      creadorId: Value(creadorId),
      descripcion: Value(descripcion),
      fechaPublicacion: Value(fechaPublicacion),
      aprobado: Value(aprobado),
    );
  }

  factory RetoGlobal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RetoGlobal(
      id: serializer.fromJson<int>(json['id']),
      creadorId: serializer.fromJson<int>(json['creadorId']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      fechaPublicacion: serializer.fromJson<DateTime>(json['fechaPublicacion']),
      aprobado: serializer.fromJson<bool>(json['aprobado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'creadorId': serializer.toJson<int>(creadorId),
      'descripcion': serializer.toJson<String>(descripcion),
      'fechaPublicacion': serializer.toJson<DateTime>(fechaPublicacion),
      'aprobado': serializer.toJson<bool>(aprobado),
    };
  }

  RetoGlobal copyWith({
    int? id,
    int? creadorId,
    String? descripcion,
    DateTime? fechaPublicacion,
    bool? aprobado,
  }) => RetoGlobal(
    id: id ?? this.id,
    creadorId: creadorId ?? this.creadorId,
    descripcion: descripcion ?? this.descripcion,
    fechaPublicacion: fechaPublicacion ?? this.fechaPublicacion,
    aprobado: aprobado ?? this.aprobado,
  );
  RetoGlobal copyWithCompanion(RetoGlobalsCompanion data) {
    return RetoGlobal(
      id: data.id.present ? data.id.value : this.id,
      creadorId: data.creadorId.present ? data.creadorId.value : this.creadorId,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      fechaPublicacion: data.fechaPublicacion.present
          ? data.fechaPublicacion.value
          : this.fechaPublicacion,
      aprobado: data.aprobado.present ? data.aprobado.value : this.aprobado,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RetoGlobal(')
          ..write('id: $id, ')
          ..write('creadorId: $creadorId, ')
          ..write('descripcion: $descripcion, ')
          ..write('fechaPublicacion: $fechaPublicacion, ')
          ..write('aprobado: $aprobado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, creadorId, descripcion, fechaPublicacion, aprobado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RetoGlobal &&
          other.id == this.id &&
          other.creadorId == this.creadorId &&
          other.descripcion == this.descripcion &&
          other.fechaPublicacion == this.fechaPublicacion &&
          other.aprobado == this.aprobado);
}

class RetoGlobalsCompanion extends UpdateCompanion<RetoGlobal> {
  final Value<int> id;
  final Value<int> creadorId;
  final Value<String> descripcion;
  final Value<DateTime> fechaPublicacion;
  final Value<bool> aprobado;
  const RetoGlobalsCompanion({
    this.id = const Value.absent(),
    this.creadorId = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.fechaPublicacion = const Value.absent(),
    this.aprobado = const Value.absent(),
  });
  RetoGlobalsCompanion.insert({
    this.id = const Value.absent(),
    required int creadorId,
    required String descripcion,
    this.fechaPublicacion = const Value.absent(),
    this.aprobado = const Value.absent(),
  }) : creadorId = Value(creadorId),
       descripcion = Value(descripcion);
  static Insertable<RetoGlobal> custom({
    Expression<int>? id,
    Expression<int>? creadorId,
    Expression<String>? descripcion,
    Expression<DateTime>? fechaPublicacion,
    Expression<bool>? aprobado,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (creadorId != null) 'creador_id': creadorId,
      if (descripcion != null) 'descripcion': descripcion,
      if (fechaPublicacion != null) 'fecha_publicacion': fechaPublicacion,
      if (aprobado != null) 'aprobado': aprobado,
    });
  }

  RetoGlobalsCompanion copyWith({
    Value<int>? id,
    Value<int>? creadorId,
    Value<String>? descripcion,
    Value<DateTime>? fechaPublicacion,
    Value<bool>? aprobado,
  }) {
    return RetoGlobalsCompanion(
      id: id ?? this.id,
      creadorId: creadorId ?? this.creadorId,
      descripcion: descripcion ?? this.descripcion,
      fechaPublicacion: fechaPublicacion ?? this.fechaPublicacion,
      aprobado: aprobado ?? this.aprobado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (creadorId.present) {
      map['creador_id'] = Variable<int>(creadorId.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (fechaPublicacion.present) {
      map['fecha_publicacion'] = Variable<DateTime>(fechaPublicacion.value);
    }
    if (aprobado.present) {
      map['aprobado'] = Variable<bool>(aprobado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RetoGlobalsCompanion(')
          ..write('id: $id, ')
          ..write('creadorId: $creadorId, ')
          ..write('descripcion: $descripcion, ')
          ..write('fechaPublicacion: $fechaPublicacion, ')
          ..write('aprobado: $aprobado')
          ..write(')'))
        .toString();
  }
}

class $ValidacionRetoGlobalsTable extends ValidacionRetoGlobals
    with TableInfo<$ValidacionRetoGlobalsTable, ValidacionRetoGlobal> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ValidacionRetoGlobalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _retoGlobalIdMeta = const VerificationMeta(
    'retoGlobalId',
  );
  @override
  late final GeneratedColumn<int> retoGlobalId = GeneratedColumn<int>(
    'reto_global_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reto_globals (id)',
    ),
  );
  static const VerificationMeta _moderadorIdMeta = const VerificationMeta(
    'moderadorId',
  );
  @override
  late final GeneratedColumn<int> moderadorId = GeneratedColumn<int>(
    'moderador_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _estadoMeta = const VerificationMeta('estado');
  @override
  late final GeneratedColumn<String> estado = GeneratedColumn<String>(
    'estado',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaValidacionMeta = const VerificationMeta(
    'fechaValidacion',
  );
  @override
  late final GeneratedColumn<DateTime> fechaValidacion =
      GeneratedColumn<DateTime>(
        'fecha_validacion',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    retoGlobalId,
    moderadorId,
    estado,
    fechaValidacion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'validacion_reto_globals';
  @override
  VerificationContext validateIntegrity(
    Insertable<ValidacionRetoGlobal> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('reto_global_id')) {
      context.handle(
        _retoGlobalIdMeta,
        retoGlobalId.isAcceptableOrUnknown(
          data['reto_global_id']!,
          _retoGlobalIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_retoGlobalIdMeta);
    }
    if (data.containsKey('moderador_id')) {
      context.handle(
        _moderadorIdMeta,
        moderadorId.isAcceptableOrUnknown(
          data['moderador_id']!,
          _moderadorIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_moderadorIdMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(
        _estadoMeta,
        estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta),
      );
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('fecha_validacion')) {
      context.handle(
        _fechaValidacionMeta,
        fechaValidacion.isAcceptableOrUnknown(
          data['fecha_validacion']!,
          _fechaValidacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ValidacionRetoGlobal map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ValidacionRetoGlobal(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      retoGlobalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reto_global_id'],
      )!,
      moderadorId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}moderador_id'],
      )!,
      estado: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}estado'],
      )!,
      fechaValidacion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_validacion'],
      )!,
    );
  }

  @override
  $ValidacionRetoGlobalsTable createAlias(String alias) {
    return $ValidacionRetoGlobalsTable(attachedDatabase, alias);
  }
}

class ValidacionRetoGlobal extends DataClass
    implements Insertable<ValidacionRetoGlobal> {
  final int id;
  final int retoGlobalId;
  final int moderadorId;
  final String estado;
  final DateTime fechaValidacion;
  const ValidacionRetoGlobal({
    required this.id,
    required this.retoGlobalId,
    required this.moderadorId,
    required this.estado,
    required this.fechaValidacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['reto_global_id'] = Variable<int>(retoGlobalId);
    map['moderador_id'] = Variable<int>(moderadorId);
    map['estado'] = Variable<String>(estado);
    map['fecha_validacion'] = Variable<DateTime>(fechaValidacion);
    return map;
  }

  ValidacionRetoGlobalsCompanion toCompanion(bool nullToAbsent) {
    return ValidacionRetoGlobalsCompanion(
      id: Value(id),
      retoGlobalId: Value(retoGlobalId),
      moderadorId: Value(moderadorId),
      estado: Value(estado),
      fechaValidacion: Value(fechaValidacion),
    );
  }

  factory ValidacionRetoGlobal.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ValidacionRetoGlobal(
      id: serializer.fromJson<int>(json['id']),
      retoGlobalId: serializer.fromJson<int>(json['retoGlobalId']),
      moderadorId: serializer.fromJson<int>(json['moderadorId']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaValidacion: serializer.fromJson<DateTime>(json['fechaValidacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'retoGlobalId': serializer.toJson<int>(retoGlobalId),
      'moderadorId': serializer.toJson<int>(moderadorId),
      'estado': serializer.toJson<String>(estado),
      'fechaValidacion': serializer.toJson<DateTime>(fechaValidacion),
    };
  }

  ValidacionRetoGlobal copyWith({
    int? id,
    int? retoGlobalId,
    int? moderadorId,
    String? estado,
    DateTime? fechaValidacion,
  }) => ValidacionRetoGlobal(
    id: id ?? this.id,
    retoGlobalId: retoGlobalId ?? this.retoGlobalId,
    moderadorId: moderadorId ?? this.moderadorId,
    estado: estado ?? this.estado,
    fechaValidacion: fechaValidacion ?? this.fechaValidacion,
  );
  ValidacionRetoGlobal copyWithCompanion(ValidacionRetoGlobalsCompanion data) {
    return ValidacionRetoGlobal(
      id: data.id.present ? data.id.value : this.id,
      retoGlobalId: data.retoGlobalId.present
          ? data.retoGlobalId.value
          : this.retoGlobalId,
      moderadorId: data.moderadorId.present
          ? data.moderadorId.value
          : this.moderadorId,
      estado: data.estado.present ? data.estado.value : this.estado,
      fechaValidacion: data.fechaValidacion.present
          ? data.fechaValidacion.value
          : this.fechaValidacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ValidacionRetoGlobal(')
          ..write('id: $id, ')
          ..write('retoGlobalId: $retoGlobalId, ')
          ..write('moderadorId: $moderadorId, ')
          ..write('estado: $estado, ')
          ..write('fechaValidacion: $fechaValidacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, retoGlobalId, moderadorId, estado, fechaValidacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValidacionRetoGlobal &&
          other.id == this.id &&
          other.retoGlobalId == this.retoGlobalId &&
          other.moderadorId == this.moderadorId &&
          other.estado == this.estado &&
          other.fechaValidacion == this.fechaValidacion);
}

class ValidacionRetoGlobalsCompanion
    extends UpdateCompanion<ValidacionRetoGlobal> {
  final Value<int> id;
  final Value<int> retoGlobalId;
  final Value<int> moderadorId;
  final Value<String> estado;
  final Value<DateTime> fechaValidacion;
  const ValidacionRetoGlobalsCompanion({
    this.id = const Value.absent(),
    this.retoGlobalId = const Value.absent(),
    this.moderadorId = const Value.absent(),
    this.estado = const Value.absent(),
    this.fechaValidacion = const Value.absent(),
  });
  ValidacionRetoGlobalsCompanion.insert({
    this.id = const Value.absent(),
    required int retoGlobalId,
    required int moderadorId,
    required String estado,
    this.fechaValidacion = const Value.absent(),
  }) : retoGlobalId = Value(retoGlobalId),
       moderadorId = Value(moderadorId),
       estado = Value(estado);
  static Insertable<ValidacionRetoGlobal> custom({
    Expression<int>? id,
    Expression<int>? retoGlobalId,
    Expression<int>? moderadorId,
    Expression<String>? estado,
    Expression<DateTime>? fechaValidacion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (retoGlobalId != null) 'reto_global_id': retoGlobalId,
      if (moderadorId != null) 'moderador_id': moderadorId,
      if (estado != null) 'estado': estado,
      if (fechaValidacion != null) 'fecha_validacion': fechaValidacion,
    });
  }

  ValidacionRetoGlobalsCompanion copyWith({
    Value<int>? id,
    Value<int>? retoGlobalId,
    Value<int>? moderadorId,
    Value<String>? estado,
    Value<DateTime>? fechaValidacion,
  }) {
    return ValidacionRetoGlobalsCompanion(
      id: id ?? this.id,
      retoGlobalId: retoGlobalId ?? this.retoGlobalId,
      moderadorId: moderadorId ?? this.moderadorId,
      estado: estado ?? this.estado,
      fechaValidacion: fechaValidacion ?? this.fechaValidacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (retoGlobalId.present) {
      map['reto_global_id'] = Variable<int>(retoGlobalId.value);
    }
    if (moderadorId.present) {
      map['moderador_id'] = Variable<int>(moderadorId.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (fechaValidacion.present) {
      map['fecha_validacion'] = Variable<DateTime>(fechaValidacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ValidacionRetoGlobalsCompanion(')
          ..write('id: $id, ')
          ..write('retoGlobalId: $retoGlobalId, ')
          ..write('moderadorId: $moderadorId, ')
          ..write('estado: $estado, ')
          ..write('fechaValidacion: $fechaValidacion')
          ..write(')'))
        .toString();
  }
}

class $EvidenciasTable extends Evidencias
    with TableInfo<$EvidenciasTable, Evidencia> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvidenciasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _retoDiarioIdMeta = const VerificationMeta(
    'retoDiarioId',
  );
  @override
  late final GeneratedColumn<int> retoDiarioId = GeneratedColumn<int>(
    'reto_diario_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reto_diarios (id)',
    ),
  );
  static const VerificationMeta _retoGlobalIdMeta = const VerificationMeta(
    'retoGlobalId',
  );
  @override
  late final GeneratedColumn<int> retoGlobalId = GeneratedColumn<int>(
    'reto_global_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES reto_globals (id)',
    ),
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contenidoMeta = const VerificationMeta(
    'contenido',
  );
  @override
  late final GeneratedColumn<String> contenido = GeneratedColumn<String>(
    'contenido',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fechaSubidaMeta = const VerificationMeta(
    'fechaSubida',
  );
  @override
  late final GeneratedColumn<DateTime> fechaSubida = GeneratedColumn<DateTime>(
    'fecha_subida',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    retoDiarioId,
    retoGlobalId,
    tipo,
    contenido,
    fechaSubida,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evidencias';
  @override
  VerificationContext validateIntegrity(
    Insertable<Evidencia> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('reto_diario_id')) {
      context.handle(
        _retoDiarioIdMeta,
        retoDiarioId.isAcceptableOrUnknown(
          data['reto_diario_id']!,
          _retoDiarioIdMeta,
        ),
      );
    }
    if (data.containsKey('reto_global_id')) {
      context.handle(
        _retoGlobalIdMeta,
        retoGlobalId.isAcceptableOrUnknown(
          data['reto_global_id']!,
          _retoGlobalIdMeta,
        ),
      );
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('contenido')) {
      context.handle(
        _contenidoMeta,
        contenido.isAcceptableOrUnknown(data['contenido']!, _contenidoMeta),
      );
    }
    if (data.containsKey('fecha_subida')) {
      context.handle(
        _fechaSubidaMeta,
        fechaSubida.isAcceptableOrUnknown(
          data['fecha_subida']!,
          _fechaSubidaMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Evidencia map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Evidencia(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      retoDiarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reto_diario_id'],
      ),
      retoGlobalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reto_global_id'],
      ),
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      contenido: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contenido'],
      ),
      fechaSubida: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_subida'],
      )!,
    );
  }

  @override
  $EvidenciasTable createAlias(String alias) {
    return $EvidenciasTable(attachedDatabase, alias);
  }
}

class Evidencia extends DataClass implements Insertable<Evidencia> {
  final int id;
  final int usuarioId;
  final int? retoDiarioId;
  final int? retoGlobalId;
  final String tipo;
  final String? contenido;
  final DateTime fechaSubida;
  const Evidencia({
    required this.id,
    required this.usuarioId,
    this.retoDiarioId,
    this.retoGlobalId,
    required this.tipo,
    this.contenido,
    required this.fechaSubida,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    if (!nullToAbsent || retoDiarioId != null) {
      map['reto_diario_id'] = Variable<int>(retoDiarioId);
    }
    if (!nullToAbsent || retoGlobalId != null) {
      map['reto_global_id'] = Variable<int>(retoGlobalId);
    }
    map['tipo'] = Variable<String>(tipo);
    if (!nullToAbsent || contenido != null) {
      map['contenido'] = Variable<String>(contenido);
    }
    map['fecha_subida'] = Variable<DateTime>(fechaSubida);
    return map;
  }

  EvidenciasCompanion toCompanion(bool nullToAbsent) {
    return EvidenciasCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      retoDiarioId: retoDiarioId == null && nullToAbsent
          ? const Value.absent()
          : Value(retoDiarioId),
      retoGlobalId: retoGlobalId == null && nullToAbsent
          ? const Value.absent()
          : Value(retoGlobalId),
      tipo: Value(tipo),
      contenido: contenido == null && nullToAbsent
          ? const Value.absent()
          : Value(contenido),
      fechaSubida: Value(fechaSubida),
    );
  }

  factory Evidencia.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Evidencia(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      retoDiarioId: serializer.fromJson<int?>(json['retoDiarioId']),
      retoGlobalId: serializer.fromJson<int?>(json['retoGlobalId']),
      tipo: serializer.fromJson<String>(json['tipo']),
      contenido: serializer.fromJson<String?>(json['contenido']),
      fechaSubida: serializer.fromJson<DateTime>(json['fechaSubida']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'retoDiarioId': serializer.toJson<int?>(retoDiarioId),
      'retoGlobalId': serializer.toJson<int?>(retoGlobalId),
      'tipo': serializer.toJson<String>(tipo),
      'contenido': serializer.toJson<String?>(contenido),
      'fechaSubida': serializer.toJson<DateTime>(fechaSubida),
    };
  }

  Evidencia copyWith({
    int? id,
    int? usuarioId,
    Value<int?> retoDiarioId = const Value.absent(),
    Value<int?> retoGlobalId = const Value.absent(),
    String? tipo,
    Value<String?> contenido = const Value.absent(),
    DateTime? fechaSubida,
  }) => Evidencia(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    retoDiarioId: retoDiarioId.present ? retoDiarioId.value : this.retoDiarioId,
    retoGlobalId: retoGlobalId.present ? retoGlobalId.value : this.retoGlobalId,
    tipo: tipo ?? this.tipo,
    contenido: contenido.present ? contenido.value : this.contenido,
    fechaSubida: fechaSubida ?? this.fechaSubida,
  );
  Evidencia copyWithCompanion(EvidenciasCompanion data) {
    return Evidencia(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      retoDiarioId: data.retoDiarioId.present
          ? data.retoDiarioId.value
          : this.retoDiarioId,
      retoGlobalId: data.retoGlobalId.present
          ? data.retoGlobalId.value
          : this.retoGlobalId,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      contenido: data.contenido.present ? data.contenido.value : this.contenido,
      fechaSubida: data.fechaSubida.present
          ? data.fechaSubida.value
          : this.fechaSubida,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Evidencia(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('retoDiarioId: $retoDiarioId, ')
          ..write('retoGlobalId: $retoGlobalId, ')
          ..write('tipo: $tipo, ')
          ..write('contenido: $contenido, ')
          ..write('fechaSubida: $fechaSubida')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    usuarioId,
    retoDiarioId,
    retoGlobalId,
    tipo,
    contenido,
    fechaSubida,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Evidencia &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.retoDiarioId == this.retoDiarioId &&
          other.retoGlobalId == this.retoGlobalId &&
          other.tipo == this.tipo &&
          other.contenido == this.contenido &&
          other.fechaSubida == this.fechaSubida);
}

class EvidenciasCompanion extends UpdateCompanion<Evidencia> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<int?> retoDiarioId;
  final Value<int?> retoGlobalId;
  final Value<String> tipo;
  final Value<String?> contenido;
  final Value<DateTime> fechaSubida;
  const EvidenciasCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.retoDiarioId = const Value.absent(),
    this.retoGlobalId = const Value.absent(),
    this.tipo = const Value.absent(),
    this.contenido = const Value.absent(),
    this.fechaSubida = const Value.absent(),
  });
  EvidenciasCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    this.retoDiarioId = const Value.absent(),
    this.retoGlobalId = const Value.absent(),
    required String tipo,
    this.contenido = const Value.absent(),
    this.fechaSubida = const Value.absent(),
  }) : usuarioId = Value(usuarioId),
       tipo = Value(tipo);
  static Insertable<Evidencia> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<int>? retoDiarioId,
    Expression<int>? retoGlobalId,
    Expression<String>? tipo,
    Expression<String>? contenido,
    Expression<DateTime>? fechaSubida,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (retoDiarioId != null) 'reto_diario_id': retoDiarioId,
      if (retoGlobalId != null) 'reto_global_id': retoGlobalId,
      if (tipo != null) 'tipo': tipo,
      if (contenido != null) 'contenido': contenido,
      if (fechaSubida != null) 'fecha_subida': fechaSubida,
    });
  }

  EvidenciasCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<int?>? retoDiarioId,
    Value<int?>? retoGlobalId,
    Value<String>? tipo,
    Value<String?>? contenido,
    Value<DateTime>? fechaSubida,
  }) {
    return EvidenciasCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      retoDiarioId: retoDiarioId ?? this.retoDiarioId,
      retoGlobalId: retoGlobalId ?? this.retoGlobalId,
      tipo: tipo ?? this.tipo,
      contenido: contenido ?? this.contenido,
      fechaSubida: fechaSubida ?? this.fechaSubida,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (retoDiarioId.present) {
      map['reto_diario_id'] = Variable<int>(retoDiarioId.value);
    }
    if (retoGlobalId.present) {
      map['reto_global_id'] = Variable<int>(retoGlobalId.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (contenido.present) {
      map['contenido'] = Variable<String>(contenido.value);
    }
    if (fechaSubida.present) {
      map['fecha_subida'] = Variable<DateTime>(fechaSubida.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvidenciasCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('retoDiarioId: $retoDiarioId, ')
          ..write('retoGlobalId: $retoGlobalId, ')
          ..write('tipo: $tipo, ')
          ..write('contenido: $contenido, ')
          ..write('fechaSubida: $fechaSubida')
          ..write(')'))
        .toString();
  }
}

class $PuntuacionsTable extends Puntuacions
    with TableInfo<$PuntuacionsTable, Puntuacion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PuntuacionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _puntosMeta = const VerificationMeta('puntos');
  @override
  late final GeneratedColumn<int> puntos = GeneratedColumn<int>(
    'puntos',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _rachaMeta = const VerificationMeta('racha');
  @override
  late final GeneratedColumn<int> racha = GeneratedColumn<int>(
    'racha',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [id, usuarioId, puntos, racha];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'puntuacions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Puntuacion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('puntos')) {
      context.handle(
        _puntosMeta,
        puntos.isAcceptableOrUnknown(data['puntos']!, _puntosMeta),
      );
    }
    if (data.containsKey('racha')) {
      context.handle(
        _rachaMeta,
        racha.isAcceptableOrUnknown(data['racha']!, _rachaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Puntuacion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Puntuacion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      puntos: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}puntos'],
      )!,
      racha: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}racha'],
      )!,
    );
  }

  @override
  $PuntuacionsTable createAlias(String alias) {
    return $PuntuacionsTable(attachedDatabase, alias);
  }
}

class Puntuacion extends DataClass implements Insertable<Puntuacion> {
  final int id;
  final int usuarioId;
  final int puntos;
  final int racha;
  const Puntuacion({
    required this.id,
    required this.usuarioId,
    required this.puntos,
    required this.racha,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    map['puntos'] = Variable<int>(puntos);
    map['racha'] = Variable<int>(racha);
    return map;
  }

  PuntuacionsCompanion toCompanion(bool nullToAbsent) {
    return PuntuacionsCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      puntos: Value(puntos),
      racha: Value(racha),
    );
  }

  factory Puntuacion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Puntuacion(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      puntos: serializer.fromJson<int>(json['puntos']),
      racha: serializer.fromJson<int>(json['racha']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'puntos': serializer.toJson<int>(puntos),
      'racha': serializer.toJson<int>(racha),
    };
  }

  Puntuacion copyWith({int? id, int? usuarioId, int? puntos, int? racha}) =>
      Puntuacion(
        id: id ?? this.id,
        usuarioId: usuarioId ?? this.usuarioId,
        puntos: puntos ?? this.puntos,
        racha: racha ?? this.racha,
      );
  Puntuacion copyWithCompanion(PuntuacionsCompanion data) {
    return Puntuacion(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      puntos: data.puntos.present ? data.puntos.value : this.puntos,
      racha: data.racha.present ? data.racha.value : this.racha,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Puntuacion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('puntos: $puntos, ')
          ..write('racha: $racha')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, usuarioId, puntos, racha);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Puntuacion &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.puntos == this.puntos &&
          other.racha == this.racha);
}

class PuntuacionsCompanion extends UpdateCompanion<Puntuacion> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<int> puntos;
  final Value<int> racha;
  const PuntuacionsCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.puntos = const Value.absent(),
    this.racha = const Value.absent(),
  });
  PuntuacionsCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    this.puntos = const Value.absent(),
    this.racha = const Value.absent(),
  }) : usuarioId = Value(usuarioId);
  static Insertable<Puntuacion> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<int>? puntos,
    Expression<int>? racha,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (puntos != null) 'puntos': puntos,
      if (racha != null) 'racha': racha,
    });
  }

  PuntuacionsCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<int>? puntos,
    Value<int>? racha,
  }) {
    return PuntuacionsCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      puntos: puntos ?? this.puntos,
      racha: racha ?? this.racha,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (puntos.present) {
      map['puntos'] = Variable<int>(puntos.value);
    }
    if (racha.present) {
      map['racha'] = Variable<int>(racha.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PuntuacionsCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('puntos: $puntos, ')
          ..write('racha: $racha')
          ..write(')'))
        .toString();
  }
}

class $RankingsTable extends Rankings with TableInfo<$RankingsTable, Ranking> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RankingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'UNIQUE REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _puntosTotalesMeta = const VerificationMeta(
    'puntosTotales',
  );
  @override
  late final GeneratedColumn<int> puntosTotales = GeneratedColumn<int>(
    'puntos_totales',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _posicionMeta = const VerificationMeta(
    'posicion',
  );
  @override
  late final GeneratedColumn<int> posicion = GeneratedColumn<int>(
    'posicion',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fechaActualizacionMeta =
      const VerificationMeta('fechaActualizacion');
  @override
  late final GeneratedColumn<DateTime> fechaActualizacion =
      GeneratedColumn<DateTime>(
        'fecha_actualizacion',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    puntosTotales,
    posicion,
    fechaActualizacion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rankings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ranking> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('puntos_totales')) {
      context.handle(
        _puntosTotalesMeta,
        puntosTotales.isAcceptableOrUnknown(
          data['puntos_totales']!,
          _puntosTotalesMeta,
        ),
      );
    }
    if (data.containsKey('posicion')) {
      context.handle(
        _posicionMeta,
        posicion.isAcceptableOrUnknown(data['posicion']!, _posicionMeta),
      );
    }
    if (data.containsKey('fecha_actualizacion')) {
      context.handle(
        _fechaActualizacionMeta,
        fechaActualizacion.isAcceptableOrUnknown(
          data['fecha_actualizacion']!,
          _fechaActualizacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ranking map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ranking(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      puntosTotales: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}puntos_totales'],
      )!,
      posicion: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}posicion'],
      )!,
      fechaActualizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha_actualizacion'],
      )!,
    );
  }

  @override
  $RankingsTable createAlias(String alias) {
    return $RankingsTable(attachedDatabase, alias);
  }
}

class Ranking extends DataClass implements Insertable<Ranking> {
  final int id;
  final int usuarioId;
  final int puntosTotales;
  final int posicion;
  final DateTime fechaActualizacion;
  const Ranking({
    required this.id,
    required this.usuarioId,
    required this.puntosTotales,
    required this.posicion,
    required this.fechaActualizacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    map['puntos_totales'] = Variable<int>(puntosTotales);
    map['posicion'] = Variable<int>(posicion);
    map['fecha_actualizacion'] = Variable<DateTime>(fechaActualizacion);
    return map;
  }

  RankingsCompanion toCompanion(bool nullToAbsent) {
    return RankingsCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      puntosTotales: Value(puntosTotales),
      posicion: Value(posicion),
      fechaActualizacion: Value(fechaActualizacion),
    );
  }

  factory Ranking.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ranking(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      puntosTotales: serializer.fromJson<int>(json['puntosTotales']),
      posicion: serializer.fromJson<int>(json['posicion']),
      fechaActualizacion: serializer.fromJson<DateTime>(
        json['fechaActualizacion'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'puntosTotales': serializer.toJson<int>(puntosTotales),
      'posicion': serializer.toJson<int>(posicion),
      'fechaActualizacion': serializer.toJson<DateTime>(fechaActualizacion),
    };
  }

  Ranking copyWith({
    int? id,
    int? usuarioId,
    int? puntosTotales,
    int? posicion,
    DateTime? fechaActualizacion,
  }) => Ranking(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    puntosTotales: puntosTotales ?? this.puntosTotales,
    posicion: posicion ?? this.posicion,
    fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
  );
  Ranking copyWithCompanion(RankingsCompanion data) {
    return Ranking(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      puntosTotales: data.puntosTotales.present
          ? data.puntosTotales.value
          : this.puntosTotales,
      posicion: data.posicion.present ? data.posicion.value : this.posicion,
      fechaActualizacion: data.fechaActualizacion.present
          ? data.fechaActualizacion.value
          : this.fechaActualizacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ranking(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('puntosTotales: $puntosTotales, ')
          ..write('posicion: $posicion, ')
          ..write('fechaActualizacion: $fechaActualizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, usuarioId, puntosTotales, posicion, fechaActualizacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ranking &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.puntosTotales == this.puntosTotales &&
          other.posicion == this.posicion &&
          other.fechaActualizacion == this.fechaActualizacion);
}

class RankingsCompanion extends UpdateCompanion<Ranking> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<int> puntosTotales;
  final Value<int> posicion;
  final Value<DateTime> fechaActualizacion;
  const RankingsCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.puntosTotales = const Value.absent(),
    this.posicion = const Value.absent(),
    this.fechaActualizacion = const Value.absent(),
  });
  RankingsCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    this.puntosTotales = const Value.absent(),
    this.posicion = const Value.absent(),
    this.fechaActualizacion = const Value.absent(),
  }) : usuarioId = Value(usuarioId);
  static Insertable<Ranking> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<int>? puntosTotales,
    Expression<int>? posicion,
    Expression<DateTime>? fechaActualizacion,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (puntosTotales != null) 'puntos_totales': puntosTotales,
      if (posicion != null) 'posicion': posicion,
      if (fechaActualizacion != null) 'fecha_actualizacion': fechaActualizacion,
    });
  }

  RankingsCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<int>? puntosTotales,
    Value<int>? posicion,
    Value<DateTime>? fechaActualizacion,
  }) {
    return RankingsCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      puntosTotales: puntosTotales ?? this.puntosTotales,
      posicion: posicion ?? this.posicion,
      fechaActualizacion: fechaActualizacion ?? this.fechaActualizacion,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (puntosTotales.present) {
      map['puntos_totales'] = Variable<int>(puntosTotales.value);
    }
    if (posicion.present) {
      map['posicion'] = Variable<int>(posicion.value);
    }
    if (fechaActualizacion.present) {
      map['fecha_actualizacion'] = Variable<DateTime>(fechaActualizacion.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RankingsCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('puntosTotales: $puntosTotales, ')
          ..write('posicion: $posicion, ')
          ..write('fechaActualizacion: $fechaActualizacion')
          ..write(')'))
        .toString();
  }
}

class $NotificacionsTable extends Notificacions
    with TableInfo<$NotificacionsTable, Notificacion> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificacionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _usuarioIdMeta = const VerificationMeta(
    'usuarioId',
  );
  @override
  late final GeneratedColumn<int> usuarioId = GeneratedColumn<int>(
    'usuario_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES usuarios (id)',
    ),
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mensajeMeta = const VerificationMeta(
    'mensaje',
  );
  @override
  late final GeneratedColumn<String> mensaje = GeneratedColumn<String>(
    'mensaje',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fechaMeta = const VerificationMeta('fecha');
  @override
  late final GeneratedColumn<DateTime> fecha = GeneratedColumn<DateTime>(
    'fecha',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _leidaMeta = const VerificationMeta('leida');
  @override
  late final GeneratedColumn<bool> leida = GeneratedColumn<bool>(
    'leida',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("leida" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    usuarioId,
    tipo,
    mensaje,
    fecha,
    leida,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notificacions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Notificacion> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('usuario_id')) {
      context.handle(
        _usuarioIdMeta,
        usuarioId.isAcceptableOrUnknown(data['usuario_id']!, _usuarioIdMeta),
      );
    } else if (isInserting) {
      context.missing(_usuarioIdMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('mensaje')) {
      context.handle(
        _mensajeMeta,
        mensaje.isAcceptableOrUnknown(data['mensaje']!, _mensajeMeta),
      );
    } else if (isInserting) {
      context.missing(_mensajeMeta);
    }
    if (data.containsKey('fecha')) {
      context.handle(
        _fechaMeta,
        fecha.isAcceptableOrUnknown(data['fecha']!, _fechaMeta),
      );
    }
    if (data.containsKey('leida')) {
      context.handle(
        _leidaMeta,
        leida.isAcceptableOrUnknown(data['leida']!, _leidaMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Notificacion map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Notificacion(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      usuarioId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usuario_id'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      mensaje: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mensaje'],
      )!,
      fecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fecha'],
      )!,
      leida: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}leida'],
      )!,
    );
  }

  @override
  $NotificacionsTable createAlias(String alias) {
    return $NotificacionsTable(attachedDatabase, alias);
  }
}

class Notificacion extends DataClass implements Insertable<Notificacion> {
  final int id;
  final int usuarioId;
  final String tipo;
  final String mensaje;
  final DateTime fecha;
  final bool leida;
  const Notificacion({
    required this.id,
    required this.usuarioId,
    required this.tipo,
    required this.mensaje,
    required this.fecha,
    required this.leida,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['usuario_id'] = Variable<int>(usuarioId);
    map['tipo'] = Variable<String>(tipo);
    map['mensaje'] = Variable<String>(mensaje);
    map['fecha'] = Variable<DateTime>(fecha);
    map['leida'] = Variable<bool>(leida);
    return map;
  }

  NotificacionsCompanion toCompanion(bool nullToAbsent) {
    return NotificacionsCompanion(
      id: Value(id),
      usuarioId: Value(usuarioId),
      tipo: Value(tipo),
      mensaje: Value(mensaje),
      fecha: Value(fecha),
      leida: Value(leida),
    );
  }

  factory Notificacion.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Notificacion(
      id: serializer.fromJson<int>(json['id']),
      usuarioId: serializer.fromJson<int>(json['usuarioId']),
      tipo: serializer.fromJson<String>(json['tipo']),
      mensaje: serializer.fromJson<String>(json['mensaje']),
      fecha: serializer.fromJson<DateTime>(json['fecha']),
      leida: serializer.fromJson<bool>(json['leida']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuarioId': serializer.toJson<int>(usuarioId),
      'tipo': serializer.toJson<String>(tipo),
      'mensaje': serializer.toJson<String>(mensaje),
      'fecha': serializer.toJson<DateTime>(fecha),
      'leida': serializer.toJson<bool>(leida),
    };
  }

  Notificacion copyWith({
    int? id,
    int? usuarioId,
    String? tipo,
    String? mensaje,
    DateTime? fecha,
    bool? leida,
  }) => Notificacion(
    id: id ?? this.id,
    usuarioId: usuarioId ?? this.usuarioId,
    tipo: tipo ?? this.tipo,
    mensaje: mensaje ?? this.mensaje,
    fecha: fecha ?? this.fecha,
    leida: leida ?? this.leida,
  );
  Notificacion copyWithCompanion(NotificacionsCompanion data) {
    return Notificacion(
      id: data.id.present ? data.id.value : this.id,
      usuarioId: data.usuarioId.present ? data.usuarioId.value : this.usuarioId,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      mensaje: data.mensaje.present ? data.mensaje.value : this.mensaje,
      fecha: data.fecha.present ? data.fecha.value : this.fecha,
      leida: data.leida.present ? data.leida.value : this.leida,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Notificacion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('tipo: $tipo, ')
          ..write('mensaje: $mensaje, ')
          ..write('fecha: $fecha, ')
          ..write('leida: $leida')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, usuarioId, tipo, mensaje, fecha, leida);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Notificacion &&
          other.id == this.id &&
          other.usuarioId == this.usuarioId &&
          other.tipo == this.tipo &&
          other.mensaje == this.mensaje &&
          other.fecha == this.fecha &&
          other.leida == this.leida);
}

class NotificacionsCompanion extends UpdateCompanion<Notificacion> {
  final Value<int> id;
  final Value<int> usuarioId;
  final Value<String> tipo;
  final Value<String> mensaje;
  final Value<DateTime> fecha;
  final Value<bool> leida;
  const NotificacionsCompanion({
    this.id = const Value.absent(),
    this.usuarioId = const Value.absent(),
    this.tipo = const Value.absent(),
    this.mensaje = const Value.absent(),
    this.fecha = const Value.absent(),
    this.leida = const Value.absent(),
  });
  NotificacionsCompanion.insert({
    this.id = const Value.absent(),
    required int usuarioId,
    required String tipo,
    required String mensaje,
    this.fecha = const Value.absent(),
    this.leida = const Value.absent(),
  }) : usuarioId = Value(usuarioId),
       tipo = Value(tipo),
       mensaje = Value(mensaje);
  static Insertable<Notificacion> custom({
    Expression<int>? id,
    Expression<int>? usuarioId,
    Expression<String>? tipo,
    Expression<String>? mensaje,
    Expression<DateTime>? fecha,
    Expression<bool>? leida,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuarioId != null) 'usuario_id': usuarioId,
      if (tipo != null) 'tipo': tipo,
      if (mensaje != null) 'mensaje': mensaje,
      if (fecha != null) 'fecha': fecha,
      if (leida != null) 'leida': leida,
    });
  }

  NotificacionsCompanion copyWith({
    Value<int>? id,
    Value<int>? usuarioId,
    Value<String>? tipo,
    Value<String>? mensaje,
    Value<DateTime>? fecha,
    Value<bool>? leida,
  }) {
    return NotificacionsCompanion(
      id: id ?? this.id,
      usuarioId: usuarioId ?? this.usuarioId,
      tipo: tipo ?? this.tipo,
      mensaje: mensaje ?? this.mensaje,
      fecha: fecha ?? this.fecha,
      leida: leida ?? this.leida,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuarioId.present) {
      map['usuario_id'] = Variable<int>(usuarioId.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (mensaje.present) {
      map['mensaje'] = Variable<String>(mensaje.value);
    }
    if (fecha.present) {
      map['fecha'] = Variable<DateTime>(fecha.value);
    }
    if (leida.present) {
      map['leida'] = Variable<bool>(leida.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificacionsCompanion(')
          ..write('id: $id, ')
          ..write('usuarioId: $usuarioId, ')
          ..write('tipo: $tipo, ')
          ..write('mensaje: $mensaje, ')
          ..write('fecha: $fecha, ')
          ..write('leida: $leida')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsuariosTable usuarios = $UsuariosTable(this);
  late final $RolsTable rols = $RolsTable(this);
  late final $UsuarioRolsTable usuarioRols = $UsuarioRolsTable(this);
  late final $CuestionariosTable cuestionarios = $CuestionariosTable(this);
  late final $PreguntasTable preguntas = $PreguntasTable(this);
  late final $RespuestasTable respuestas = $RespuestasTable(this);
  late final $PerfilsTable perfils = $PerfilsTable(this);
  late final $HistorialPerfilsTable historialPerfils = $HistorialPerfilsTable(
    this,
  );
  late final $RetoPredefinidosTable retoPredefinidos = $RetoPredefinidosTable(
    this,
  );
  late final $RetoDiariosTable retoDiarios = $RetoDiariosTable(this);
  late final $RetoGlobalsTable retoGlobals = $RetoGlobalsTable(this);
  late final $ValidacionRetoGlobalsTable validacionRetoGlobals =
      $ValidacionRetoGlobalsTable(this);
  late final $EvidenciasTable evidencias = $EvidenciasTable(this);
  late final $PuntuacionsTable puntuacions = $PuntuacionsTable(this);
  late final $RankingsTable rankings = $RankingsTable(this);
  late final $NotificacionsTable notificacions = $NotificacionsTable(this);
  late final UsuarioDao usuarioDao = UsuarioDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    usuarios,
    rols,
    usuarioRols,
    cuestionarios,
    preguntas,
    respuestas,
    perfils,
    historialPerfils,
    retoPredefinidos,
    retoDiarios,
    retoGlobals,
    validacionRetoGlobals,
    evidencias,
    puntuacions,
    rankings,
    notificacions,
  ];
}

typedef $$UsuariosTableCreateCompanionBuilder =
    UsuariosCompanion Function({
      Value<int> id,
      required String nombre,
      required String correo,
      Value<String?> telefono,
      required String password,
      Value<String?> googleId,
      Value<DateTime> fechaRegistro,
    });
typedef $$UsuariosTableUpdateCompanionBuilder =
    UsuariosCompanion Function({
      Value<int> id,
      Value<String> nombre,
      Value<String> correo,
      Value<String?> telefono,
      Value<String> password,
      Value<String?> googleId,
      Value<DateTime> fechaRegistro,
    });

final class $$UsuariosTableReferences
    extends BaseReferences<_$AppDatabase, $UsuariosTable, Usuario> {
  $$UsuariosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsuarioRolsTable, List<UsuarioRol>>
  _usuarioRolsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.usuarioRols,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.usuarioRols.usuarioId),
  );

  $$UsuarioRolsTableProcessedTableManager get usuarioRolsRefs {
    final manager = $$UsuarioRolsTableTableManager(
      $_db,
      $_db.usuarioRols,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_usuarioRolsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$CuestionariosTable, List<Cuestionario>>
  _cuestionariosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cuestionarios,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.cuestionarios.usuarioId),
  );

  $$CuestionariosTableProcessedTableManager get cuestionariosRefs {
    final manager = $$CuestionariosTableTableManager(
      $_db,
      $_db.cuestionarios,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cuestionariosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RespuestasTable, List<Respuesta>>
  _respuestasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.respuestas,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.respuestas.usuarioId),
  );

  $$RespuestasTableProcessedTableManager get respuestasRefs {
    final manager = $$RespuestasTableTableManager(
      $_db,
      $_db.respuestas,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_respuestasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PerfilsTable, List<Perfil>> _perfilsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.perfils,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.perfils.usuarioId),
  );

  $$PerfilsTableProcessedTableManager get perfilsRefs {
    final manager = $$PerfilsTableTableManager(
      $_db,
      $_db.perfils,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_perfilsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$HistorialPerfilsTable, List<HistorialPerfil>>
  _historialPerfilsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.historialPerfils,
    aliasName: $_aliasNameGenerator(
      db.usuarios.id,
      db.historialPerfils.usuarioId,
    ),
  );

  $$HistorialPerfilsTableProcessedTableManager get historialPerfilsRefs {
    final manager = $$HistorialPerfilsTableTableManager(
      $_db,
      $_db.historialPerfils,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _historialPerfilsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RetoDiariosTable, List<RetoDiario>>
  _retoDiariosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.retoDiarios,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.retoDiarios.usuarioId),
  );

  $$RetoDiariosTableProcessedTableManager get retoDiariosRefs {
    final manager = $$RetoDiariosTableTableManager(
      $_db,
      $_db.retoDiarios,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_retoDiariosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RetoGlobalsTable, List<RetoGlobal>>
  _retoGlobalsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.retoGlobals,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.retoGlobals.creadorId),
  );

  $$RetoGlobalsTableProcessedTableManager get retoGlobalsRefs {
    final manager = $$RetoGlobalsTableTableManager(
      $_db,
      $_db.retoGlobals,
    ).filter((f) => f.creadorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_retoGlobalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $ValidacionRetoGlobalsTable,
    List<ValidacionRetoGlobal>
  >
  _validacionRetoGlobalsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.validacionRetoGlobals,
        aliasName: $_aliasNameGenerator(
          db.usuarios.id,
          db.validacionRetoGlobals.moderadorId,
        ),
      );

  $$ValidacionRetoGlobalsTableProcessedTableManager
  get validacionRetoGlobalsRefs {
    final manager = $$ValidacionRetoGlobalsTableTableManager(
      $_db,
      $_db.validacionRetoGlobals,
    ).filter((f) => f.moderadorId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _validacionRetoGlobalsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EvidenciasTable, List<Evidencia>>
  _evidenciasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.evidencias,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.evidencias.usuarioId),
  );

  $$EvidenciasTableProcessedTableManager get evidenciasRefs {
    final manager = $$EvidenciasTableTableManager(
      $_db,
      $_db.evidencias,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_evidenciasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PuntuacionsTable, List<Puntuacion>>
  _puntuacionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.puntuacions,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.puntuacions.usuarioId),
  );

  $$PuntuacionsTableProcessedTableManager get puntuacionsRefs {
    final manager = $$PuntuacionsTableTableManager(
      $_db,
      $_db.puntuacions,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_puntuacionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RankingsTable, List<Ranking>> _rankingsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.rankings,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.rankings.usuarioId),
  );

  $$RankingsTableProcessedTableManager get rankingsRefs {
    final manager = $$RankingsTableTableManager(
      $_db,
      $_db.rankings,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_rankingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$NotificacionsTable, List<Notificacion>>
  _notificacionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.notificacions,
    aliasName: $_aliasNameGenerator(db.usuarios.id, db.notificacions.usuarioId),
  );

  $$NotificacionsTableProcessedTableManager get notificacionsRefs {
    final manager = $$NotificacionsTableTableManager(
      $_db,
      $_db.notificacions,
    ).filter((f) => f.usuarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_notificacionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsuariosTableFilterComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get correo => $composableBuilder(
    column: $table.correo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaRegistro => $composableBuilder(
    column: $table.fechaRegistro,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usuarioRolsRefs(
    Expression<bool> Function($$UsuarioRolsTableFilterComposer f) f,
  ) {
    final $$UsuarioRolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.usuarioRols,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuarioRolsTableFilterComposer(
            $db: $db,
            $table: $db.usuarioRols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> cuestionariosRefs(
    Expression<bool> Function($$CuestionariosTableFilterComposer f) f,
  ) {
    final $$CuestionariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cuestionarios,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CuestionariosTableFilterComposer(
            $db: $db,
            $table: $db.cuestionarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> respuestasRefs(
    Expression<bool> Function($$RespuestasTableFilterComposer f) f,
  ) {
    final $$RespuestasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respuestas,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespuestasTableFilterComposer(
            $db: $db,
            $table: $db.respuestas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> perfilsRefs(
    Expression<bool> Function($$PerfilsTableFilterComposer f) f,
  ) {
    final $$PerfilsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.perfils,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PerfilsTableFilterComposer(
            $db: $db,
            $table: $db.perfils,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> historialPerfilsRefs(
    Expression<bool> Function($$HistorialPerfilsTableFilterComposer f) f,
  ) {
    final $$HistorialPerfilsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historialPerfils,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistorialPerfilsTableFilterComposer(
            $db: $db,
            $table: $db.historialPerfils,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> retoDiariosRefs(
    Expression<bool> Function($$RetoDiariosTableFilterComposer f) f,
  ) {
    final $$RetoDiariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retoDiarios,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoDiariosTableFilterComposer(
            $db: $db,
            $table: $db.retoDiarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> retoGlobalsRefs(
    Expression<bool> Function($$RetoGlobalsTableFilterComposer f) f,
  ) {
    final $$RetoGlobalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.creadorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableFilterComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> validacionRetoGlobalsRefs(
    Expression<bool> Function($$ValidacionRetoGlobalsTableFilterComposer f) f,
  ) {
    final $$ValidacionRetoGlobalsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.validacionRetoGlobals,
          getReferencedColumn: (t) => t.moderadorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ValidacionRetoGlobalsTableFilterComposer(
                $db: $db,
                $table: $db.validacionRetoGlobals,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> evidenciasRefs(
    Expression<bool> Function($$EvidenciasTableFilterComposer f) f,
  ) {
    final $$EvidenciasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.evidencias,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EvidenciasTableFilterComposer(
            $db: $db,
            $table: $db.evidencias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> puntuacionsRefs(
    Expression<bool> Function($$PuntuacionsTableFilterComposer f) f,
  ) {
    final $$PuntuacionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.puntuacions,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuntuacionsTableFilterComposer(
            $db: $db,
            $table: $db.puntuacions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> rankingsRefs(
    Expression<bool> Function($$RankingsTableFilterComposer f) f,
  ) {
    final $$RankingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rankings,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RankingsTableFilterComposer(
            $db: $db,
            $table: $db.rankings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> notificacionsRefs(
    Expression<bool> Function($$NotificacionsTableFilterComposer f) f,
  ) {
    final $$NotificacionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notificacions,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificacionsTableFilterComposer(
            $db: $db,
            $table: $db.notificacions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsuariosTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get correo => $composableBuilder(
    column: $table.correo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaRegistro => $composableBuilder(
    column: $table.fechaRegistro,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsuariosTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuariosTable> {
  $$UsuariosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get correo =>
      $composableBuilder(column: $table.correo, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get googleId =>
      $composableBuilder(column: $table.googleId, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaRegistro => $composableBuilder(
    column: $table.fechaRegistro,
    builder: (column) => column,
  );

  Expression<T> usuarioRolsRefs<T extends Object>(
    Expression<T> Function($$UsuarioRolsTableAnnotationComposer a) f,
  ) {
    final $$UsuarioRolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.usuarioRols,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuarioRolsTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarioRols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> cuestionariosRefs<T extends Object>(
    Expression<T> Function($$CuestionariosTableAnnotationComposer a) f,
  ) {
    final $$CuestionariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cuestionarios,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CuestionariosTableAnnotationComposer(
            $db: $db,
            $table: $db.cuestionarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> respuestasRefs<T extends Object>(
    Expression<T> Function($$RespuestasTableAnnotationComposer a) f,
  ) {
    final $$RespuestasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respuestas,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespuestasTableAnnotationComposer(
            $db: $db,
            $table: $db.respuestas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> perfilsRefs<T extends Object>(
    Expression<T> Function($$PerfilsTableAnnotationComposer a) f,
  ) {
    final $$PerfilsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.perfils,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PerfilsTableAnnotationComposer(
            $db: $db,
            $table: $db.perfils,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> historialPerfilsRefs<T extends Object>(
    Expression<T> Function($$HistorialPerfilsTableAnnotationComposer a) f,
  ) {
    final $$HistorialPerfilsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.historialPerfils,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HistorialPerfilsTableAnnotationComposer(
            $db: $db,
            $table: $db.historialPerfils,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> retoDiariosRefs<T extends Object>(
    Expression<T> Function($$RetoDiariosTableAnnotationComposer a) f,
  ) {
    final $$RetoDiariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retoDiarios,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoDiariosTableAnnotationComposer(
            $db: $db,
            $table: $db.retoDiarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> retoGlobalsRefs<T extends Object>(
    Expression<T> Function($$RetoGlobalsTableAnnotationComposer a) f,
  ) {
    final $$RetoGlobalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.creadorId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableAnnotationComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> validacionRetoGlobalsRefs<T extends Object>(
    Expression<T> Function($$ValidacionRetoGlobalsTableAnnotationComposer a) f,
  ) {
    final $$ValidacionRetoGlobalsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.validacionRetoGlobals,
          getReferencedColumn: (t) => t.moderadorId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ValidacionRetoGlobalsTableAnnotationComposer(
                $db: $db,
                $table: $db.validacionRetoGlobals,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> evidenciasRefs<T extends Object>(
    Expression<T> Function($$EvidenciasTableAnnotationComposer a) f,
  ) {
    final $$EvidenciasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.evidencias,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EvidenciasTableAnnotationComposer(
            $db: $db,
            $table: $db.evidencias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> puntuacionsRefs<T extends Object>(
    Expression<T> Function($$PuntuacionsTableAnnotationComposer a) f,
  ) {
    final $$PuntuacionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.puntuacions,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PuntuacionsTableAnnotationComposer(
            $db: $db,
            $table: $db.puntuacions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> rankingsRefs<T extends Object>(
    Expression<T> Function($$RankingsTableAnnotationComposer a) f,
  ) {
    final $$RankingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.rankings,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RankingsTableAnnotationComposer(
            $db: $db,
            $table: $db.rankings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> notificacionsRefs<T extends Object>(
    Expression<T> Function($$NotificacionsTableAnnotationComposer a) f,
  ) {
    final $$NotificacionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.notificacions,
      getReferencedColumn: (t) => t.usuarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NotificacionsTableAnnotationComposer(
            $db: $db,
            $table: $db.notificacions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsuariosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsuariosTable,
          Usuario,
          $$UsuariosTableFilterComposer,
          $$UsuariosTableOrderingComposer,
          $$UsuariosTableAnnotationComposer,
          $$UsuariosTableCreateCompanionBuilder,
          $$UsuariosTableUpdateCompanionBuilder,
          (Usuario, $$UsuariosTableReferences),
          Usuario,
          PrefetchHooks Function({
            bool usuarioRolsRefs,
            bool cuestionariosRefs,
            bool respuestasRefs,
            bool perfilsRefs,
            bool historialPerfilsRefs,
            bool retoDiariosRefs,
            bool retoGlobalsRefs,
            bool validacionRetoGlobalsRefs,
            bool evidenciasRefs,
            bool puntuacionsRefs,
            bool rankingsRefs,
            bool notificacionsRefs,
          })
        > {
  $$UsuariosTableTableManager(_$AppDatabase db, $UsuariosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuariosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuariosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsuariosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> correo = const Value.absent(),
                Value<String?> telefono = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String?> googleId = const Value.absent(),
                Value<DateTime> fechaRegistro = const Value.absent(),
              }) => UsuariosCompanion(
                id: id,
                nombre: nombre,
                correo: correo,
                telefono: telefono,
                password: password,
                googleId: googleId,
                fechaRegistro: fechaRegistro,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
                required String correo,
                Value<String?> telefono = const Value.absent(),
                required String password,
                Value<String?> googleId = const Value.absent(),
                Value<DateTime> fechaRegistro = const Value.absent(),
              }) => UsuariosCompanion.insert(
                id: id,
                nombre: nombre,
                correo: correo,
                telefono: telefono,
                password: password,
                googleId: googleId,
                fechaRegistro: fechaRegistro,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UsuariosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                usuarioRolsRefs = false,
                cuestionariosRefs = false,
                respuestasRefs = false,
                perfilsRefs = false,
                historialPerfilsRefs = false,
                retoDiariosRefs = false,
                retoGlobalsRefs = false,
                validacionRetoGlobalsRefs = false,
                evidenciasRefs = false,
                puntuacionsRefs = false,
                rankingsRefs = false,
                notificacionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (usuarioRolsRefs) db.usuarioRols,
                    if (cuestionariosRefs) db.cuestionarios,
                    if (respuestasRefs) db.respuestas,
                    if (perfilsRefs) db.perfils,
                    if (historialPerfilsRefs) db.historialPerfils,
                    if (retoDiariosRefs) db.retoDiarios,
                    if (retoGlobalsRefs) db.retoGlobals,
                    if (validacionRetoGlobalsRefs) db.validacionRetoGlobals,
                    if (evidenciasRefs) db.evidencias,
                    if (puntuacionsRefs) db.puntuacions,
                    if (rankingsRefs) db.rankings,
                    if (notificacionsRefs) db.notificacions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (usuarioRolsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          UsuarioRol
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._usuarioRolsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).usuarioRolsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (cuestionariosRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          Cuestionario
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._cuestionariosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).cuestionariosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (respuestasRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          Respuesta
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._respuestasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).respuestasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (perfilsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          Perfil
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._perfilsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).perfilsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (historialPerfilsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          HistorialPerfil
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._historialPerfilsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).historialPerfilsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (retoDiariosRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          RetoDiario
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._retoDiariosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).retoDiariosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (retoGlobalsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          RetoGlobal
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._retoGlobalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).retoGlobalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.creadorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (validacionRetoGlobalsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          ValidacionRetoGlobal
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._validacionRetoGlobalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).validacionRetoGlobalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.moderadorId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (evidenciasRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          Evidencia
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._evidenciasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).evidenciasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (puntuacionsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          Puntuacion
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._puntuacionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).puntuacionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (rankingsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          Ranking
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._rankingsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).rankingsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (notificacionsRefs)
                        await $_getPrefetchedData<
                          Usuario,
                          $UsuariosTable,
                          Notificacion
                        >(
                          currentTable: table,
                          referencedTable: $$UsuariosTableReferences
                              ._notificacionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsuariosTableReferences(
                                db,
                                table,
                                p0,
                              ).notificacionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.usuarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsuariosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsuariosTable,
      Usuario,
      $$UsuariosTableFilterComposer,
      $$UsuariosTableOrderingComposer,
      $$UsuariosTableAnnotationComposer,
      $$UsuariosTableCreateCompanionBuilder,
      $$UsuariosTableUpdateCompanionBuilder,
      (Usuario, $$UsuariosTableReferences),
      Usuario,
      PrefetchHooks Function({
        bool usuarioRolsRefs,
        bool cuestionariosRefs,
        bool respuestasRefs,
        bool perfilsRefs,
        bool historialPerfilsRefs,
        bool retoDiariosRefs,
        bool retoGlobalsRefs,
        bool validacionRetoGlobalsRefs,
        bool evidenciasRefs,
        bool puntuacionsRefs,
        bool rankingsRefs,
        bool notificacionsRefs,
      })
    >;
typedef $$RolsTableCreateCompanionBuilder =
    RolsCompanion Function({Value<int> id, required String nombre});
typedef $$RolsTableUpdateCompanionBuilder =
    RolsCompanion Function({Value<int> id, Value<String> nombre});

final class $$RolsTableReferences
    extends BaseReferences<_$AppDatabase, $RolsTable, Rol> {
  $$RolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsuarioRolsTable, List<UsuarioRol>>
  _usuarioRolsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.usuarioRols,
    aliasName: $_aliasNameGenerator(db.rols.id, db.usuarioRols.rolId),
  );

  $$UsuarioRolsTableProcessedTableManager get usuarioRolsRefs {
    final manager = $$UsuarioRolsTableTableManager(
      $_db,
      $_db.usuarioRols,
    ).filter((f) => f.rolId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_usuarioRolsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RolsTableFilterComposer extends Composer<_$AppDatabase, $RolsTable> {
  $$RolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> usuarioRolsRefs(
    Expression<bool> Function($$UsuarioRolsTableFilterComposer f) f,
  ) {
    final $$UsuarioRolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.usuarioRols,
      getReferencedColumn: (t) => t.rolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuarioRolsTableFilterComposer(
            $db: $db,
            $table: $db.usuarioRols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RolsTableOrderingComposer extends Composer<_$AppDatabase, $RolsTable> {
  $$RolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RolsTable> {
  $$RolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  Expression<T> usuarioRolsRefs<T extends Object>(
    Expression<T> Function($$UsuarioRolsTableAnnotationComposer a) f,
  ) {
    final $$UsuarioRolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.usuarioRols,
      getReferencedColumn: (t) => t.rolId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuarioRolsTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarioRols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RolsTable,
          Rol,
          $$RolsTableFilterComposer,
          $$RolsTableOrderingComposer,
          $$RolsTableAnnotationComposer,
          $$RolsTableCreateCompanionBuilder,
          $$RolsTableUpdateCompanionBuilder,
          (Rol, $$RolsTableReferences),
          Rol,
          PrefetchHooks Function({bool usuarioRolsRefs})
        > {
  $$RolsTableTableManager(_$AppDatabase db, $RolsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nombre = const Value.absent(),
              }) => RolsCompanion(id: id, nombre: nombre),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nombre,
              }) => RolsCompanion.insert(id: id, nombre: nombre),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$RolsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioRolsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (usuarioRolsRefs) db.usuarioRols],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usuarioRolsRefs)
                    await $_getPrefetchedData<Rol, $RolsTable, UsuarioRol>(
                      currentTable: table,
                      referencedTable: $$RolsTableReferences
                          ._usuarioRolsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RolsTableReferences(db, table, p0).usuarioRolsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.rolId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RolsTable,
      Rol,
      $$RolsTableFilterComposer,
      $$RolsTableOrderingComposer,
      $$RolsTableAnnotationComposer,
      $$RolsTableCreateCompanionBuilder,
      $$RolsTableUpdateCompanionBuilder,
      (Rol, $$RolsTableReferences),
      Rol,
      PrefetchHooks Function({bool usuarioRolsRefs})
    >;
typedef $$UsuarioRolsTableCreateCompanionBuilder =
    UsuarioRolsCompanion Function({
      required int usuarioId,
      required int rolId,
      Value<int> rowid,
    });
typedef $$UsuarioRolsTableUpdateCompanionBuilder =
    UsuarioRolsCompanion Function({
      Value<int> usuarioId,
      Value<int> rolId,
      Value<int> rowid,
    });

final class $$UsuarioRolsTableReferences
    extends BaseReferences<_$AppDatabase, $UsuarioRolsTable, UsuarioRol> {
  $$UsuarioRolsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.usuarioRols.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RolsTable _rolIdTable(_$AppDatabase db) => db.rols.createAlias(
    $_aliasNameGenerator(db.usuarioRols.rolId, db.rols.id),
  );

  $$RolsTableProcessedTableManager get rolId {
    final $_column = $_itemColumn<int>('rol_id')!;

    final manager = $$RolsTableTableManager(
      $_db,
      $_db.rols,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_rolIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UsuarioRolsTableFilterComposer
    extends Composer<_$AppDatabase, $UsuarioRolsTable> {
  $$UsuarioRolsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RolsTableFilterComposer get rolId {
    final $$RolsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rolId,
      referencedTable: $db.rols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolsTableFilterComposer(
            $db: $db,
            $table: $db.rols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsuarioRolsTableOrderingComposer
    extends Composer<_$AppDatabase, $UsuarioRolsTable> {
  $$UsuarioRolsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RolsTableOrderingComposer get rolId {
    final $$RolsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rolId,
      referencedTable: $db.rols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolsTableOrderingComposer(
            $db: $db,
            $table: $db.rols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsuarioRolsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsuarioRolsTable> {
  $$UsuarioRolsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RolsTableAnnotationComposer get rolId {
    final $$RolsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.rolId,
      referencedTable: $db.rols,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RolsTableAnnotationComposer(
            $db: $db,
            $table: $db.rols,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UsuarioRolsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsuarioRolsTable,
          UsuarioRol,
          $$UsuarioRolsTableFilterComposer,
          $$UsuarioRolsTableOrderingComposer,
          $$UsuarioRolsTableAnnotationComposer,
          $$UsuarioRolsTableCreateCompanionBuilder,
          $$UsuarioRolsTableUpdateCompanionBuilder,
          (UsuarioRol, $$UsuarioRolsTableReferences),
          UsuarioRol,
          PrefetchHooks Function({bool usuarioId, bool rolId})
        > {
  $$UsuarioRolsTableTableManager(_$AppDatabase db, $UsuarioRolsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsuarioRolsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsuarioRolsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsuarioRolsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> usuarioId = const Value.absent(),
                Value<int> rolId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UsuarioRolsCompanion(
                usuarioId: usuarioId,
                rolId: rolId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int usuarioId,
                required int rolId,
                Value<int> rowid = const Value.absent(),
              }) => UsuarioRolsCompanion.insert(
                usuarioId: usuarioId,
                rolId: rolId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UsuarioRolsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false, rolId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$UsuarioRolsTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$UsuarioRolsTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (rolId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.rolId,
                                referencedTable: $$UsuarioRolsTableReferences
                                    ._rolIdTable(db),
                                referencedColumn: $$UsuarioRolsTableReferences
                                    ._rolIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UsuarioRolsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsuarioRolsTable,
      UsuarioRol,
      $$UsuarioRolsTableFilterComposer,
      $$UsuarioRolsTableOrderingComposer,
      $$UsuarioRolsTableAnnotationComposer,
      $$UsuarioRolsTableCreateCompanionBuilder,
      $$UsuarioRolsTableUpdateCompanionBuilder,
      (UsuarioRol, $$UsuarioRolsTableReferences),
      UsuarioRol,
      PrefetchHooks Function({bool usuarioId, bool rolId})
    >;
typedef $$CuestionariosTableCreateCompanionBuilder =
    CuestionariosCompanion Function({
      Value<int> id,
      required int usuarioId,
      Value<DateTime> fechaCreacion,
    });
typedef $$CuestionariosTableUpdateCompanionBuilder =
    CuestionariosCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<DateTime> fechaCreacion,
    });

final class $$CuestionariosTableReferences
    extends BaseReferences<_$AppDatabase, $CuestionariosTable, Cuestionario> {
  $$CuestionariosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.cuestionarios.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$PreguntasTable, List<Pregunta>>
  _preguntasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.preguntas,
    aliasName: $_aliasNameGenerator(
      db.cuestionarios.id,
      db.preguntas.cuestionarioId,
    ),
  );

  $$PreguntasTableProcessedTableManager get preguntasRefs {
    final manager = $$PreguntasTableTableManager(
      $_db,
      $_db.preguntas,
    ).filter((f) => f.cuestionarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_preguntasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CuestionariosTableFilterComposer
    extends Composer<_$AppDatabase, $CuestionariosTable> {
  $$CuestionariosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaCreacion => $composableBuilder(
    column: $table.fechaCreacion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> preguntasRefs(
    Expression<bool> Function($$PreguntasTableFilterComposer f) f,
  ) {
    final $$PreguntasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.cuestionarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableFilterComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CuestionariosTableOrderingComposer
    extends Composer<_$AppDatabase, $CuestionariosTable> {
  $$CuestionariosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaCreacion => $composableBuilder(
    column: $table.fechaCreacion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CuestionariosTableAnnotationComposer
    extends Composer<_$AppDatabase, $CuestionariosTable> {
  $$CuestionariosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaCreacion => $composableBuilder(
    column: $table.fechaCreacion,
    builder: (column) => column,
  );

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> preguntasRefs<T extends Object>(
    Expression<T> Function($$PreguntasTableAnnotationComposer a) f,
  ) {
    final $$PreguntasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.cuestionarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CuestionariosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CuestionariosTable,
          Cuestionario,
          $$CuestionariosTableFilterComposer,
          $$CuestionariosTableOrderingComposer,
          $$CuestionariosTableAnnotationComposer,
          $$CuestionariosTableCreateCompanionBuilder,
          $$CuestionariosTableUpdateCompanionBuilder,
          (Cuestionario, $$CuestionariosTableReferences),
          Cuestionario,
          PrefetchHooks Function({bool usuarioId, bool preguntasRefs})
        > {
  $$CuestionariosTableTableManager(_$AppDatabase db, $CuestionariosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CuestionariosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CuestionariosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CuestionariosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<DateTime> fechaCreacion = const Value.absent(),
              }) => CuestionariosCompanion(
                id: id,
                usuarioId: usuarioId,
                fechaCreacion: fechaCreacion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                Value<DateTime> fechaCreacion = const Value.absent(),
              }) => CuestionariosCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                fechaCreacion: fechaCreacion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CuestionariosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false, preguntasRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (preguntasRefs) db.preguntas],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$CuestionariosTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$CuestionariosTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (preguntasRefs)
                    await $_getPrefetchedData<
                      Cuestionario,
                      $CuestionariosTable,
                      Pregunta
                    >(
                      currentTable: table,
                      referencedTable: $$CuestionariosTableReferences
                          ._preguntasRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CuestionariosTableReferences(
                            db,
                            table,
                            p0,
                          ).preguntasRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.cuestionarioId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CuestionariosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CuestionariosTable,
      Cuestionario,
      $$CuestionariosTableFilterComposer,
      $$CuestionariosTableOrderingComposer,
      $$CuestionariosTableAnnotationComposer,
      $$CuestionariosTableCreateCompanionBuilder,
      $$CuestionariosTableUpdateCompanionBuilder,
      (Cuestionario, $$CuestionariosTableReferences),
      Cuestionario,
      PrefetchHooks Function({bool usuarioId, bool preguntasRefs})
    >;
typedef $$PreguntasTableCreateCompanionBuilder =
    PreguntasCompanion Function({
      Value<int> id,
      required int cuestionarioId,
      required String texto,
      required String tipo,
    });
typedef $$PreguntasTableUpdateCompanionBuilder =
    PreguntasCompanion Function({
      Value<int> id,
      Value<int> cuestionarioId,
      Value<String> texto,
      Value<String> tipo,
    });

final class $$PreguntasTableReferences
    extends BaseReferences<_$AppDatabase, $PreguntasTable, Pregunta> {
  $$PreguntasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CuestionariosTable _cuestionarioIdTable(_$AppDatabase db) =>
      db.cuestionarios.createAlias(
        $_aliasNameGenerator(db.preguntas.cuestionarioId, db.cuestionarios.id),
      );

  $$CuestionariosTableProcessedTableManager get cuestionarioId {
    final $_column = $_itemColumn<int>('cuestionario_id')!;

    final manager = $$CuestionariosTableTableManager(
      $_db,
      $_db.cuestionarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cuestionarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RespuestasTable, List<Respuesta>>
  _respuestasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.respuestas,
    aliasName: $_aliasNameGenerator(db.preguntas.id, db.respuestas.preguntaId),
  );

  $$RespuestasTableProcessedTableManager get respuestasRefs {
    final manager = $$RespuestasTableTableManager(
      $_db,
      $_db.respuestas,
    ).filter((f) => f.preguntaId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_respuestasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PreguntasTableFilterComposer
    extends Composer<_$AppDatabase, $PreguntasTable> {
  $$PreguntasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  $$CuestionariosTableFilterComposer get cuestionarioId {
    final $$CuestionariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cuestionarioId,
      referencedTable: $db.cuestionarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CuestionariosTableFilterComposer(
            $db: $db,
            $table: $db.cuestionarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> respuestasRefs(
    Expression<bool> Function($$RespuestasTableFilterComposer f) f,
  ) {
    final $$RespuestasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respuestas,
      getReferencedColumn: (t) => t.preguntaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespuestasTableFilterComposer(
            $db: $db,
            $table: $db.respuestas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PreguntasTableOrderingComposer
    extends Composer<_$AppDatabase, $PreguntasTable> {
  $$PreguntasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get texto => $composableBuilder(
    column: $table.texto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  $$CuestionariosTableOrderingComposer get cuestionarioId {
    final $$CuestionariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cuestionarioId,
      referencedTable: $db.cuestionarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CuestionariosTableOrderingComposer(
            $db: $db,
            $table: $db.cuestionarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PreguntasTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreguntasTable> {
  $$PreguntasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get texto =>
      $composableBuilder(column: $table.texto, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  $$CuestionariosTableAnnotationComposer get cuestionarioId {
    final $$CuestionariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.cuestionarioId,
      referencedTable: $db.cuestionarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CuestionariosTableAnnotationComposer(
            $db: $db,
            $table: $db.cuestionarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> respuestasRefs<T extends Object>(
    Expression<T> Function($$RespuestasTableAnnotationComposer a) f,
  ) {
    final $$RespuestasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.respuestas,
      getReferencedColumn: (t) => t.preguntaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RespuestasTableAnnotationComposer(
            $db: $db,
            $table: $db.respuestas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PreguntasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreguntasTable,
          Pregunta,
          $$PreguntasTableFilterComposer,
          $$PreguntasTableOrderingComposer,
          $$PreguntasTableAnnotationComposer,
          $$PreguntasTableCreateCompanionBuilder,
          $$PreguntasTableUpdateCompanionBuilder,
          (Pregunta, $$PreguntasTableReferences),
          Pregunta,
          PrefetchHooks Function({bool cuestionarioId, bool respuestasRefs})
        > {
  $$PreguntasTableTableManager(_$AppDatabase db, $PreguntasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PreguntasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PreguntasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PreguntasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> cuestionarioId = const Value.absent(),
                Value<String> texto = const Value.absent(),
                Value<String> tipo = const Value.absent(),
              }) => PreguntasCompanion(
                id: id,
                cuestionarioId: cuestionarioId,
                texto: texto,
                tipo: tipo,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int cuestionarioId,
                required String texto,
                required String tipo,
              }) => PreguntasCompanion.insert(
                id: id,
                cuestionarioId: cuestionarioId,
                texto: texto,
                tipo: tipo,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PreguntasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({cuestionarioId = false, respuestasRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (respuestasRefs) db.respuestas],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (cuestionarioId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.cuestionarioId,
                                    referencedTable: $$PreguntasTableReferences
                                        ._cuestionarioIdTable(db),
                                    referencedColumn: $$PreguntasTableReferences
                                        ._cuestionarioIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (respuestasRefs)
                        await $_getPrefetchedData<
                          Pregunta,
                          $PreguntasTable,
                          Respuesta
                        >(
                          currentTable: table,
                          referencedTable: $$PreguntasTableReferences
                              ._respuestasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PreguntasTableReferences(
                                db,
                                table,
                                p0,
                              ).respuestasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.preguntaId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PreguntasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreguntasTable,
      Pregunta,
      $$PreguntasTableFilterComposer,
      $$PreguntasTableOrderingComposer,
      $$PreguntasTableAnnotationComposer,
      $$PreguntasTableCreateCompanionBuilder,
      $$PreguntasTableUpdateCompanionBuilder,
      (Pregunta, $$PreguntasTableReferences),
      Pregunta,
      PrefetchHooks Function({bool cuestionarioId, bool respuestasRefs})
    >;
typedef $$RespuestasTableCreateCompanionBuilder =
    RespuestasCompanion Function({
      Value<int> id,
      required int preguntaId,
      required int usuarioId,
      Value<String?> respuestaTexto,
      Value<DateTime> fechaRespuesta,
    });
typedef $$RespuestasTableUpdateCompanionBuilder =
    RespuestasCompanion Function({
      Value<int> id,
      Value<int> preguntaId,
      Value<int> usuarioId,
      Value<String?> respuestaTexto,
      Value<DateTime> fechaRespuesta,
    });

final class $$RespuestasTableReferences
    extends BaseReferences<_$AppDatabase, $RespuestasTable, Respuesta> {
  $$RespuestasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PreguntasTable _preguntaIdTable(_$AppDatabase db) =>
      db.preguntas.createAlias(
        $_aliasNameGenerator(db.respuestas.preguntaId, db.preguntas.id),
      );

  $$PreguntasTableProcessedTableManager get preguntaId {
    final $_column = $_itemColumn<int>('pregunta_id')!;

    final manager = $$PreguntasTableTableManager(
      $_db,
      $_db.preguntas,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_preguntaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.respuestas.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RespuestasTableFilterComposer
    extends Composer<_$AppDatabase, $RespuestasTable> {
  $$RespuestasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get respuestaTexto => $composableBuilder(
    column: $table.respuestaTexto,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaRespuesta => $composableBuilder(
    column: $table.fechaRespuesta,
    builder: (column) => ColumnFilters(column),
  );

  $$PreguntasTableFilterComposer get preguntaId {
    final $$PreguntasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.preguntaId,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableFilterComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RespuestasTableOrderingComposer
    extends Composer<_$AppDatabase, $RespuestasTable> {
  $$RespuestasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get respuestaTexto => $composableBuilder(
    column: $table.respuestaTexto,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaRespuesta => $composableBuilder(
    column: $table.fechaRespuesta,
    builder: (column) => ColumnOrderings(column),
  );

  $$PreguntasTableOrderingComposer get preguntaId {
    final $$PreguntasTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.preguntaId,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableOrderingComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RespuestasTableAnnotationComposer
    extends Composer<_$AppDatabase, $RespuestasTable> {
  $$RespuestasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get respuestaTexto => $composableBuilder(
    column: $table.respuestaTexto,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaRespuesta => $composableBuilder(
    column: $table.fechaRespuesta,
    builder: (column) => column,
  );

  $$PreguntasTableAnnotationComposer get preguntaId {
    final $$PreguntasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.preguntaId,
      referencedTable: $db.preguntas,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PreguntasTableAnnotationComposer(
            $db: $db,
            $table: $db.preguntas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RespuestasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RespuestasTable,
          Respuesta,
          $$RespuestasTableFilterComposer,
          $$RespuestasTableOrderingComposer,
          $$RespuestasTableAnnotationComposer,
          $$RespuestasTableCreateCompanionBuilder,
          $$RespuestasTableUpdateCompanionBuilder,
          (Respuesta, $$RespuestasTableReferences),
          Respuesta,
          PrefetchHooks Function({bool preguntaId, bool usuarioId})
        > {
  $$RespuestasTableTableManager(_$AppDatabase db, $RespuestasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RespuestasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RespuestasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RespuestasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> preguntaId = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<String?> respuestaTexto = const Value.absent(),
                Value<DateTime> fechaRespuesta = const Value.absent(),
              }) => RespuestasCompanion(
                id: id,
                preguntaId: preguntaId,
                usuarioId: usuarioId,
                respuestaTexto: respuestaTexto,
                fechaRespuesta: fechaRespuesta,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int preguntaId,
                required int usuarioId,
                Value<String?> respuestaTexto = const Value.absent(),
                Value<DateTime> fechaRespuesta = const Value.absent(),
              }) => RespuestasCompanion.insert(
                id: id,
                preguntaId: preguntaId,
                usuarioId: usuarioId,
                respuestaTexto: respuestaTexto,
                fechaRespuesta: fechaRespuesta,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RespuestasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({preguntaId = false, usuarioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (preguntaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.preguntaId,
                                referencedTable: $$RespuestasTableReferences
                                    ._preguntaIdTable(db),
                                referencedColumn: $$RespuestasTableReferences
                                    ._preguntaIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$RespuestasTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$RespuestasTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RespuestasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RespuestasTable,
      Respuesta,
      $$RespuestasTableFilterComposer,
      $$RespuestasTableOrderingComposer,
      $$RespuestasTableAnnotationComposer,
      $$RespuestasTableCreateCompanionBuilder,
      $$RespuestasTableUpdateCompanionBuilder,
      (Respuesta, $$RespuestasTableReferences),
      Respuesta,
      PrefetchHooks Function({bool preguntaId, bool usuarioId})
    >;
typedef $$PerfilsTableCreateCompanionBuilder =
    PerfilsCompanion Function({
      Value<int> id,
      required int usuarioId,
      Value<String?> hobbies,
      Value<String?> habitos,
      Value<String?> metas,
      Value<DateTime> fechaActualizacion,
    });
typedef $$PerfilsTableUpdateCompanionBuilder =
    PerfilsCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<String?> hobbies,
      Value<String?> habitos,
      Value<String?> metas,
      Value<DateTime> fechaActualizacion,
    });

final class $$PerfilsTableReferences
    extends BaseReferences<_$AppDatabase, $PerfilsTable, Perfil> {
  $$PerfilsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) => db.usuarios
      .createAlias($_aliasNameGenerator(db.perfils.usuarioId, db.usuarios.id));

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PerfilsTableFilterComposer
    extends Composer<_$AppDatabase, $PerfilsTable> {
  $$PerfilsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hobbies => $composableBuilder(
    column: $table.hobbies,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get habitos => $composableBuilder(
    column: $table.habitos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get metas => $composableBuilder(
    column: $table.metas,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaActualizacion => $composableBuilder(
    column: $table.fechaActualizacion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PerfilsTableOrderingComposer
    extends Composer<_$AppDatabase, $PerfilsTable> {
  $$PerfilsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hobbies => $composableBuilder(
    column: $table.hobbies,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get habitos => $composableBuilder(
    column: $table.habitos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get metas => $composableBuilder(
    column: $table.metas,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaActualizacion => $composableBuilder(
    column: $table.fechaActualizacion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PerfilsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PerfilsTable> {
  $$PerfilsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get hobbies =>
      $composableBuilder(column: $table.hobbies, builder: (column) => column);

  GeneratedColumn<String> get habitos =>
      $composableBuilder(column: $table.habitos, builder: (column) => column);

  GeneratedColumn<String> get metas =>
      $composableBuilder(column: $table.metas, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaActualizacion => $composableBuilder(
    column: $table.fechaActualizacion,
    builder: (column) => column,
  );

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PerfilsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PerfilsTable,
          Perfil,
          $$PerfilsTableFilterComposer,
          $$PerfilsTableOrderingComposer,
          $$PerfilsTableAnnotationComposer,
          $$PerfilsTableCreateCompanionBuilder,
          $$PerfilsTableUpdateCompanionBuilder,
          (Perfil, $$PerfilsTableReferences),
          Perfil,
          PrefetchHooks Function({bool usuarioId})
        > {
  $$PerfilsTableTableManager(_$AppDatabase db, $PerfilsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PerfilsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PerfilsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PerfilsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<String?> hobbies = const Value.absent(),
                Value<String?> habitos = const Value.absent(),
                Value<String?> metas = const Value.absent(),
                Value<DateTime> fechaActualizacion = const Value.absent(),
              }) => PerfilsCompanion(
                id: id,
                usuarioId: usuarioId,
                hobbies: hobbies,
                habitos: habitos,
                metas: metas,
                fechaActualizacion: fechaActualizacion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                Value<String?> hobbies = const Value.absent(),
                Value<String?> habitos = const Value.absent(),
                Value<String?> metas = const Value.absent(),
                Value<DateTime> fechaActualizacion = const Value.absent(),
              }) => PerfilsCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                hobbies: hobbies,
                habitos: habitos,
                metas: metas,
                fechaActualizacion: fechaActualizacion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PerfilsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$PerfilsTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$PerfilsTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PerfilsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PerfilsTable,
      Perfil,
      $$PerfilsTableFilterComposer,
      $$PerfilsTableOrderingComposer,
      $$PerfilsTableAnnotationComposer,
      $$PerfilsTableCreateCompanionBuilder,
      $$PerfilsTableUpdateCompanionBuilder,
      (Perfil, $$PerfilsTableReferences),
      Perfil,
      PrefetchHooks Function({bool usuarioId})
    >;
typedef $$HistorialPerfilsTableCreateCompanionBuilder =
    HistorialPerfilsCompanion Function({
      Value<int> id,
      required int usuarioId,
      required String campoModificado,
      Value<String?> valorAnterior,
      Value<String?> valorNuevo,
      Value<DateTime> fecha,
    });
typedef $$HistorialPerfilsTableUpdateCompanionBuilder =
    HistorialPerfilsCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<String> campoModificado,
      Value<String?> valorAnterior,
      Value<String?> valorNuevo,
      Value<DateTime> fecha,
    });

final class $$HistorialPerfilsTableReferences
    extends
        BaseReferences<_$AppDatabase, $HistorialPerfilsTable, HistorialPerfil> {
  $$HistorialPerfilsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.historialPerfils.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$HistorialPerfilsTableFilterComposer
    extends Composer<_$AppDatabase, $HistorialPerfilsTable> {
  $$HistorialPerfilsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get campoModificado => $composableBuilder(
    column: $table.campoModificado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valorAnterior => $composableBuilder(
    column: $table.valorAnterior,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valorNuevo => $composableBuilder(
    column: $table.valorNuevo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistorialPerfilsTableOrderingComposer
    extends Composer<_$AppDatabase, $HistorialPerfilsTable> {
  $$HistorialPerfilsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get campoModificado => $composableBuilder(
    column: $table.campoModificado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valorAnterior => $composableBuilder(
    column: $table.valorAnterior,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valorNuevo => $composableBuilder(
    column: $table.valorNuevo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistorialPerfilsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HistorialPerfilsTable> {
  $$HistorialPerfilsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get campoModificado => $composableBuilder(
    column: $table.campoModificado,
    builder: (column) => column,
  );

  GeneratedColumn<String> get valorAnterior => $composableBuilder(
    column: $table.valorAnterior,
    builder: (column) => column,
  );

  GeneratedColumn<String> get valorNuevo => $composableBuilder(
    column: $table.valorNuevo,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$HistorialPerfilsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HistorialPerfilsTable,
          HistorialPerfil,
          $$HistorialPerfilsTableFilterComposer,
          $$HistorialPerfilsTableOrderingComposer,
          $$HistorialPerfilsTableAnnotationComposer,
          $$HistorialPerfilsTableCreateCompanionBuilder,
          $$HistorialPerfilsTableUpdateCompanionBuilder,
          (HistorialPerfil, $$HistorialPerfilsTableReferences),
          HistorialPerfil,
          PrefetchHooks Function({bool usuarioId})
        > {
  $$HistorialPerfilsTableTableManager(
    _$AppDatabase db,
    $HistorialPerfilsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HistorialPerfilsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HistorialPerfilsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HistorialPerfilsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<String> campoModificado = const Value.absent(),
                Value<String?> valorAnterior = const Value.absent(),
                Value<String?> valorNuevo = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => HistorialPerfilsCompanion(
                id: id,
                usuarioId: usuarioId,
                campoModificado: campoModificado,
                valorAnterior: valorAnterior,
                valorNuevo: valorNuevo,
                fecha: fecha,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                required String campoModificado,
                Value<String?> valorAnterior = const Value.absent(),
                Value<String?> valorNuevo = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
              }) => HistorialPerfilsCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                campoModificado: campoModificado,
                valorAnterior: valorAnterior,
                valorNuevo: valorNuevo,
                fecha: fecha,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$HistorialPerfilsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable:
                                    $$HistorialPerfilsTableReferences
                                        ._usuarioIdTable(db),
                                referencedColumn:
                                    $$HistorialPerfilsTableReferences
                                        ._usuarioIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$HistorialPerfilsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HistorialPerfilsTable,
      HistorialPerfil,
      $$HistorialPerfilsTableFilterComposer,
      $$HistorialPerfilsTableOrderingComposer,
      $$HistorialPerfilsTableAnnotationComposer,
      $$HistorialPerfilsTableCreateCompanionBuilder,
      $$HistorialPerfilsTableUpdateCompanionBuilder,
      (HistorialPerfil, $$HistorialPerfilsTableReferences),
      HistorialPerfil,
      PrefetchHooks Function({bool usuarioId})
    >;
typedef $$RetoPredefinidosTableCreateCompanionBuilder =
    RetoPredefinidosCompanion Function({
      Value<int> id,
      required String categoria,
      required String descripcion,
    });
typedef $$RetoPredefinidosTableUpdateCompanionBuilder =
    RetoPredefinidosCompanion Function({
      Value<int> id,
      Value<String> categoria,
      Value<String> descripcion,
    });

final class $$RetoPredefinidosTableReferences
    extends
        BaseReferences<_$AppDatabase, $RetoPredefinidosTable, RetoPredefinido> {
  $$RetoPredefinidosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$RetoDiariosTable, List<RetoDiario>>
  _retoDiariosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.retoDiarios,
    aliasName: $_aliasNameGenerator(
      db.retoPredefinidos.id,
      db.retoDiarios.retoPredefinidoId,
    ),
  );

  $$RetoDiariosTableProcessedTableManager get retoDiariosRefs {
    final manager = $$RetoDiariosTableTableManager(
      $_db,
      $_db.retoDiarios,
    ).filter((f) => f.retoPredefinidoId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_retoDiariosRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RetoPredefinidosTableFilterComposer
    extends Composer<_$AppDatabase, $RetoPredefinidosTable> {
  $$RetoPredefinidosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> retoDiariosRefs(
    Expression<bool> Function($$RetoDiariosTableFilterComposer f) f,
  ) {
    final $$RetoDiariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retoDiarios,
      getReferencedColumn: (t) => t.retoPredefinidoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoDiariosTableFilterComposer(
            $db: $db,
            $table: $db.retoDiarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RetoPredefinidosTableOrderingComposer
    extends Composer<_$AppDatabase, $RetoPredefinidosTable> {
  $$RetoPredefinidosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoria => $composableBuilder(
    column: $table.categoria,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RetoPredefinidosTableAnnotationComposer
    extends Composer<_$AppDatabase, $RetoPredefinidosTable> {
  $$RetoPredefinidosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get categoria =>
      $composableBuilder(column: $table.categoria, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  Expression<T> retoDiariosRefs<T extends Object>(
    Expression<T> Function($$RetoDiariosTableAnnotationComposer a) f,
  ) {
    final $$RetoDiariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.retoDiarios,
      getReferencedColumn: (t) => t.retoPredefinidoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoDiariosTableAnnotationComposer(
            $db: $db,
            $table: $db.retoDiarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RetoPredefinidosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RetoPredefinidosTable,
          RetoPredefinido,
          $$RetoPredefinidosTableFilterComposer,
          $$RetoPredefinidosTableOrderingComposer,
          $$RetoPredefinidosTableAnnotationComposer,
          $$RetoPredefinidosTableCreateCompanionBuilder,
          $$RetoPredefinidosTableUpdateCompanionBuilder,
          (RetoPredefinido, $$RetoPredefinidosTableReferences),
          RetoPredefinido,
          PrefetchHooks Function({bool retoDiariosRefs})
        > {
  $$RetoPredefinidosTableTableManager(
    _$AppDatabase db,
    $RetoPredefinidosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RetoPredefinidosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RetoPredefinidosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RetoPredefinidosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> categoria = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
              }) => RetoPredefinidosCompanion(
                id: id,
                categoria: categoria,
                descripcion: descripcion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String categoria,
                required String descripcion,
              }) => RetoPredefinidosCompanion.insert(
                id: id,
                categoria: categoria,
                descripcion: descripcion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RetoPredefinidosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({retoDiariosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (retoDiariosRefs) db.retoDiarios],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (retoDiariosRefs)
                    await $_getPrefetchedData<
                      RetoPredefinido,
                      $RetoPredefinidosTable,
                      RetoDiario
                    >(
                      currentTable: table,
                      referencedTable: $$RetoPredefinidosTableReferences
                          ._retoDiariosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RetoPredefinidosTableReferences(
                            db,
                            table,
                            p0,
                          ).retoDiariosRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.retoPredefinidoId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RetoPredefinidosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RetoPredefinidosTable,
      RetoPredefinido,
      $$RetoPredefinidosTableFilterComposer,
      $$RetoPredefinidosTableOrderingComposer,
      $$RetoPredefinidosTableAnnotationComposer,
      $$RetoPredefinidosTableCreateCompanionBuilder,
      $$RetoPredefinidosTableUpdateCompanionBuilder,
      (RetoPredefinido, $$RetoPredefinidosTableReferences),
      RetoPredefinido,
      PrefetchHooks Function({bool retoDiariosRefs})
    >;
typedef $$RetoDiariosTableCreateCompanionBuilder =
    RetoDiariosCompanion Function({
      Value<int> id,
      required int usuarioId,
      required int retoPredefinidoId,
      required DateTime fecha,
      Value<bool> completado,
    });
typedef $$RetoDiariosTableUpdateCompanionBuilder =
    RetoDiariosCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<int> retoPredefinidoId,
      Value<DateTime> fecha,
      Value<bool> completado,
    });

final class $$RetoDiariosTableReferences
    extends BaseReferences<_$AppDatabase, $RetoDiariosTable, RetoDiario> {
  $$RetoDiariosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.retoDiarios.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RetoPredefinidosTable _retoPredefinidoIdTable(_$AppDatabase db) =>
      db.retoPredefinidos.createAlias(
        $_aliasNameGenerator(
          db.retoDiarios.retoPredefinidoId,
          db.retoPredefinidos.id,
        ),
      );

  $$RetoPredefinidosTableProcessedTableManager get retoPredefinidoId {
    final $_column = $_itemColumn<int>('reto_predefinido_id')!;

    final manager = $$RetoPredefinidosTableTableManager(
      $_db,
      $_db.retoPredefinidos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_retoPredefinidoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EvidenciasTable, List<Evidencia>>
  _evidenciasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.evidencias,
    aliasName: $_aliasNameGenerator(
      db.retoDiarios.id,
      db.evidencias.retoDiarioId,
    ),
  );

  $$EvidenciasTableProcessedTableManager get evidenciasRefs {
    final manager = $$EvidenciasTableTableManager(
      $_db,
      $_db.evidencias,
    ).filter((f) => f.retoDiarioId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_evidenciasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RetoDiariosTableFilterComposer
    extends Composer<_$AppDatabase, $RetoDiariosTable> {
  $$RetoDiariosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completado => $composableBuilder(
    column: $table.completado,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoPredefinidosTableFilterComposer get retoPredefinidoId {
    final $$RetoPredefinidosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoPredefinidoId,
      referencedTable: $db.retoPredefinidos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoPredefinidosTableFilterComposer(
            $db: $db,
            $table: $db.retoPredefinidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> evidenciasRefs(
    Expression<bool> Function($$EvidenciasTableFilterComposer f) f,
  ) {
    final $$EvidenciasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.evidencias,
      getReferencedColumn: (t) => t.retoDiarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EvidenciasTableFilterComposer(
            $db: $db,
            $table: $db.evidencias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RetoDiariosTableOrderingComposer
    extends Composer<_$AppDatabase, $RetoDiariosTable> {
  $$RetoDiariosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completado => $composableBuilder(
    column: $table.completado,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoPredefinidosTableOrderingComposer get retoPredefinidoId {
    final $$RetoPredefinidosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoPredefinidoId,
      referencedTable: $db.retoPredefinidos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoPredefinidosTableOrderingComposer(
            $db: $db,
            $table: $db.retoPredefinidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RetoDiariosTableAnnotationComposer
    extends Composer<_$AppDatabase, $RetoDiariosTable> {
  $$RetoDiariosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  GeneratedColumn<bool> get completado => $composableBuilder(
    column: $table.completado,
    builder: (column) => column,
  );

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoPredefinidosTableAnnotationComposer get retoPredefinidoId {
    final $$RetoPredefinidosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoPredefinidoId,
      referencedTable: $db.retoPredefinidos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoPredefinidosTableAnnotationComposer(
            $db: $db,
            $table: $db.retoPredefinidos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> evidenciasRefs<T extends Object>(
    Expression<T> Function($$EvidenciasTableAnnotationComposer a) f,
  ) {
    final $$EvidenciasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.evidencias,
      getReferencedColumn: (t) => t.retoDiarioId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EvidenciasTableAnnotationComposer(
            $db: $db,
            $table: $db.evidencias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RetoDiariosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RetoDiariosTable,
          RetoDiario,
          $$RetoDiariosTableFilterComposer,
          $$RetoDiariosTableOrderingComposer,
          $$RetoDiariosTableAnnotationComposer,
          $$RetoDiariosTableCreateCompanionBuilder,
          $$RetoDiariosTableUpdateCompanionBuilder,
          (RetoDiario, $$RetoDiariosTableReferences),
          RetoDiario,
          PrefetchHooks Function({
            bool usuarioId,
            bool retoPredefinidoId,
            bool evidenciasRefs,
          })
        > {
  $$RetoDiariosTableTableManager(_$AppDatabase db, $RetoDiariosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RetoDiariosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RetoDiariosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RetoDiariosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<int> retoPredefinidoId = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                Value<bool> completado = const Value.absent(),
              }) => RetoDiariosCompanion(
                id: id,
                usuarioId: usuarioId,
                retoPredefinidoId: retoPredefinidoId,
                fecha: fecha,
                completado: completado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                required int retoPredefinidoId,
                required DateTime fecha,
                Value<bool> completado = const Value.absent(),
              }) => RetoDiariosCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                retoPredefinidoId: retoPredefinidoId,
                fecha: fecha,
                completado: completado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RetoDiariosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                usuarioId = false,
                retoPredefinidoId = false,
                evidenciasRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (evidenciasRefs) db.evidencias],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (usuarioId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.usuarioId,
                                    referencedTable:
                                        $$RetoDiariosTableReferences
                                            ._usuarioIdTable(db),
                                    referencedColumn:
                                        $$RetoDiariosTableReferences
                                            ._usuarioIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (retoPredefinidoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.retoPredefinidoId,
                                    referencedTable:
                                        $$RetoDiariosTableReferences
                                            ._retoPredefinidoIdTable(db),
                                    referencedColumn:
                                        $$RetoDiariosTableReferences
                                            ._retoPredefinidoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (evidenciasRefs)
                        await $_getPrefetchedData<
                          RetoDiario,
                          $RetoDiariosTable,
                          Evidencia
                        >(
                          currentTable: table,
                          referencedTable: $$RetoDiariosTableReferences
                              ._evidenciasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RetoDiariosTableReferences(
                                db,
                                table,
                                p0,
                              ).evidenciasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.retoDiarioId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RetoDiariosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RetoDiariosTable,
      RetoDiario,
      $$RetoDiariosTableFilterComposer,
      $$RetoDiariosTableOrderingComposer,
      $$RetoDiariosTableAnnotationComposer,
      $$RetoDiariosTableCreateCompanionBuilder,
      $$RetoDiariosTableUpdateCompanionBuilder,
      (RetoDiario, $$RetoDiariosTableReferences),
      RetoDiario,
      PrefetchHooks Function({
        bool usuarioId,
        bool retoPredefinidoId,
        bool evidenciasRefs,
      })
    >;
typedef $$RetoGlobalsTableCreateCompanionBuilder =
    RetoGlobalsCompanion Function({
      Value<int> id,
      required int creadorId,
      required String descripcion,
      Value<DateTime> fechaPublicacion,
      Value<bool> aprobado,
    });
typedef $$RetoGlobalsTableUpdateCompanionBuilder =
    RetoGlobalsCompanion Function({
      Value<int> id,
      Value<int> creadorId,
      Value<String> descripcion,
      Value<DateTime> fechaPublicacion,
      Value<bool> aprobado,
    });

final class $$RetoGlobalsTableReferences
    extends BaseReferences<_$AppDatabase, $RetoGlobalsTable, RetoGlobal> {
  $$RetoGlobalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosTable _creadorIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.retoGlobals.creadorId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get creadorId {
    final $_column = $_itemColumn<int>('creador_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_creadorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $ValidacionRetoGlobalsTable,
    List<ValidacionRetoGlobal>
  >
  _validacionRetoGlobalsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.validacionRetoGlobals,
        aliasName: $_aliasNameGenerator(
          db.retoGlobals.id,
          db.validacionRetoGlobals.retoGlobalId,
        ),
      );

  $$ValidacionRetoGlobalsTableProcessedTableManager
  get validacionRetoGlobalsRefs {
    final manager = $$ValidacionRetoGlobalsTableTableManager(
      $_db,
      $_db.validacionRetoGlobals,
    ).filter((f) => f.retoGlobalId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _validacionRetoGlobalsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EvidenciasTable, List<Evidencia>>
  _evidenciasRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.evidencias,
    aliasName: $_aliasNameGenerator(
      db.retoGlobals.id,
      db.evidencias.retoGlobalId,
    ),
  );

  $$EvidenciasTableProcessedTableManager get evidenciasRefs {
    final manager = $$EvidenciasTableTableManager(
      $_db,
      $_db.evidencias,
    ).filter((f) => f.retoGlobalId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_evidenciasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RetoGlobalsTableFilterComposer
    extends Composer<_$AppDatabase, $RetoGlobalsTable> {
  $$RetoGlobalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaPublicacion => $composableBuilder(
    column: $table.fechaPublicacion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get aprobado => $composableBuilder(
    column: $table.aprobado,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get creadorId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creadorId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> validacionRetoGlobalsRefs(
    Expression<bool> Function($$ValidacionRetoGlobalsTableFilterComposer f) f,
  ) {
    final $$ValidacionRetoGlobalsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.validacionRetoGlobals,
          getReferencedColumn: (t) => t.retoGlobalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ValidacionRetoGlobalsTableFilterComposer(
                $db: $db,
                $table: $db.validacionRetoGlobals,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> evidenciasRefs(
    Expression<bool> Function($$EvidenciasTableFilterComposer f) f,
  ) {
    final $$EvidenciasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.evidencias,
      getReferencedColumn: (t) => t.retoGlobalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EvidenciasTableFilterComposer(
            $db: $db,
            $table: $db.evidencias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RetoGlobalsTableOrderingComposer
    extends Composer<_$AppDatabase, $RetoGlobalsTable> {
  $$RetoGlobalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaPublicacion => $composableBuilder(
    column: $table.fechaPublicacion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get aprobado => $composableBuilder(
    column: $table.aprobado,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get creadorId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creadorId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RetoGlobalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RetoGlobalsTable> {
  $$RetoGlobalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fechaPublicacion => $composableBuilder(
    column: $table.fechaPublicacion,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get aprobado =>
      $composableBuilder(column: $table.aprobado, builder: (column) => column);

  $$UsuariosTableAnnotationComposer get creadorId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.creadorId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> validacionRetoGlobalsRefs<T extends Object>(
    Expression<T> Function($$ValidacionRetoGlobalsTableAnnotationComposer a) f,
  ) {
    final $$ValidacionRetoGlobalsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.validacionRetoGlobals,
          getReferencedColumn: (t) => t.retoGlobalId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ValidacionRetoGlobalsTableAnnotationComposer(
                $db: $db,
                $table: $db.validacionRetoGlobals,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> evidenciasRefs<T extends Object>(
    Expression<T> Function($$EvidenciasTableAnnotationComposer a) f,
  ) {
    final $$EvidenciasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.evidencias,
      getReferencedColumn: (t) => t.retoGlobalId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EvidenciasTableAnnotationComposer(
            $db: $db,
            $table: $db.evidencias,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RetoGlobalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RetoGlobalsTable,
          RetoGlobal,
          $$RetoGlobalsTableFilterComposer,
          $$RetoGlobalsTableOrderingComposer,
          $$RetoGlobalsTableAnnotationComposer,
          $$RetoGlobalsTableCreateCompanionBuilder,
          $$RetoGlobalsTableUpdateCompanionBuilder,
          (RetoGlobal, $$RetoGlobalsTableReferences),
          RetoGlobal,
          PrefetchHooks Function({
            bool creadorId,
            bool validacionRetoGlobalsRefs,
            bool evidenciasRefs,
          })
        > {
  $$RetoGlobalsTableTableManager(_$AppDatabase db, $RetoGlobalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RetoGlobalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RetoGlobalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RetoGlobalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> creadorId = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<DateTime> fechaPublicacion = const Value.absent(),
                Value<bool> aprobado = const Value.absent(),
              }) => RetoGlobalsCompanion(
                id: id,
                creadorId: creadorId,
                descripcion: descripcion,
                fechaPublicacion: fechaPublicacion,
                aprobado: aprobado,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int creadorId,
                required String descripcion,
                Value<DateTime> fechaPublicacion = const Value.absent(),
                Value<bool> aprobado = const Value.absent(),
              }) => RetoGlobalsCompanion.insert(
                id: id,
                creadorId: creadorId,
                descripcion: descripcion,
                fechaPublicacion: fechaPublicacion,
                aprobado: aprobado,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RetoGlobalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                creadorId = false,
                validacionRetoGlobalsRefs = false,
                evidenciasRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (validacionRetoGlobalsRefs) db.validacionRetoGlobals,
                    if (evidenciasRefs) db.evidencias,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (creadorId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.creadorId,
                                    referencedTable:
                                        $$RetoGlobalsTableReferences
                                            ._creadorIdTable(db),
                                    referencedColumn:
                                        $$RetoGlobalsTableReferences
                                            ._creadorIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (validacionRetoGlobalsRefs)
                        await $_getPrefetchedData<
                          RetoGlobal,
                          $RetoGlobalsTable,
                          ValidacionRetoGlobal
                        >(
                          currentTable: table,
                          referencedTable: $$RetoGlobalsTableReferences
                              ._validacionRetoGlobalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RetoGlobalsTableReferences(
                                db,
                                table,
                                p0,
                              ).validacionRetoGlobalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.retoGlobalId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (evidenciasRefs)
                        await $_getPrefetchedData<
                          RetoGlobal,
                          $RetoGlobalsTable,
                          Evidencia
                        >(
                          currentTable: table,
                          referencedTable: $$RetoGlobalsTableReferences
                              ._evidenciasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RetoGlobalsTableReferences(
                                db,
                                table,
                                p0,
                              ).evidenciasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.retoGlobalId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RetoGlobalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RetoGlobalsTable,
      RetoGlobal,
      $$RetoGlobalsTableFilterComposer,
      $$RetoGlobalsTableOrderingComposer,
      $$RetoGlobalsTableAnnotationComposer,
      $$RetoGlobalsTableCreateCompanionBuilder,
      $$RetoGlobalsTableUpdateCompanionBuilder,
      (RetoGlobal, $$RetoGlobalsTableReferences),
      RetoGlobal,
      PrefetchHooks Function({
        bool creadorId,
        bool validacionRetoGlobalsRefs,
        bool evidenciasRefs,
      })
    >;
typedef $$ValidacionRetoGlobalsTableCreateCompanionBuilder =
    ValidacionRetoGlobalsCompanion Function({
      Value<int> id,
      required int retoGlobalId,
      required int moderadorId,
      required String estado,
      Value<DateTime> fechaValidacion,
    });
typedef $$ValidacionRetoGlobalsTableUpdateCompanionBuilder =
    ValidacionRetoGlobalsCompanion Function({
      Value<int> id,
      Value<int> retoGlobalId,
      Value<int> moderadorId,
      Value<String> estado,
      Value<DateTime> fechaValidacion,
    });

final class $$ValidacionRetoGlobalsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ValidacionRetoGlobalsTable,
          ValidacionRetoGlobal
        > {
  $$ValidacionRetoGlobalsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RetoGlobalsTable _retoGlobalIdTable(_$AppDatabase db) =>
      db.retoGlobals.createAlias(
        $_aliasNameGenerator(
          db.validacionRetoGlobals.retoGlobalId,
          db.retoGlobals.id,
        ),
      );

  $$RetoGlobalsTableProcessedTableManager get retoGlobalId {
    final $_column = $_itemColumn<int>('reto_global_id')!;

    final manager = $$RetoGlobalsTableTableManager(
      $_db,
      $_db.retoGlobals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_retoGlobalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsuariosTable _moderadorIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(
          db.validacionRetoGlobals.moderadorId,
          db.usuarios.id,
        ),
      );

  $$UsuariosTableProcessedTableManager get moderadorId {
    final $_column = $_itemColumn<int>('moderador_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_moderadorIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ValidacionRetoGlobalsTableFilterComposer
    extends Composer<_$AppDatabase, $ValidacionRetoGlobalsTable> {
  $$ValidacionRetoGlobalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaValidacion => $composableBuilder(
    column: $table.fechaValidacion,
    builder: (column) => ColumnFilters(column),
  );

  $$RetoGlobalsTableFilterComposer get retoGlobalId {
    final $$RetoGlobalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoGlobalId,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableFilterComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuariosTableFilterComposer get moderadorId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moderadorId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ValidacionRetoGlobalsTableOrderingComposer
    extends Composer<_$AppDatabase, $ValidacionRetoGlobalsTable> {
  $$ValidacionRetoGlobalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get estado => $composableBuilder(
    column: $table.estado,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaValidacion => $composableBuilder(
    column: $table.fechaValidacion,
    builder: (column) => ColumnOrderings(column),
  );

  $$RetoGlobalsTableOrderingComposer get retoGlobalId {
    final $$RetoGlobalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoGlobalId,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableOrderingComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuariosTableOrderingComposer get moderadorId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moderadorId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ValidacionRetoGlobalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ValidacionRetoGlobalsTable> {
  $$ValidacionRetoGlobalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get estado =>
      $composableBuilder(column: $table.estado, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaValidacion => $composableBuilder(
    column: $table.fechaValidacion,
    builder: (column) => column,
  );

  $$RetoGlobalsTableAnnotationComposer get retoGlobalId {
    final $$RetoGlobalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoGlobalId,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableAnnotationComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsuariosTableAnnotationComposer get moderadorId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.moderadorId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ValidacionRetoGlobalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ValidacionRetoGlobalsTable,
          ValidacionRetoGlobal,
          $$ValidacionRetoGlobalsTableFilterComposer,
          $$ValidacionRetoGlobalsTableOrderingComposer,
          $$ValidacionRetoGlobalsTableAnnotationComposer,
          $$ValidacionRetoGlobalsTableCreateCompanionBuilder,
          $$ValidacionRetoGlobalsTableUpdateCompanionBuilder,
          (ValidacionRetoGlobal, $$ValidacionRetoGlobalsTableReferences),
          ValidacionRetoGlobal,
          PrefetchHooks Function({bool retoGlobalId, bool moderadorId})
        > {
  $$ValidacionRetoGlobalsTableTableManager(
    _$AppDatabase db,
    $ValidacionRetoGlobalsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ValidacionRetoGlobalsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$ValidacionRetoGlobalsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ValidacionRetoGlobalsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> retoGlobalId = const Value.absent(),
                Value<int> moderadorId = const Value.absent(),
                Value<String> estado = const Value.absent(),
                Value<DateTime> fechaValidacion = const Value.absent(),
              }) => ValidacionRetoGlobalsCompanion(
                id: id,
                retoGlobalId: retoGlobalId,
                moderadorId: moderadorId,
                estado: estado,
                fechaValidacion: fechaValidacion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int retoGlobalId,
                required int moderadorId,
                required String estado,
                Value<DateTime> fechaValidacion = const Value.absent(),
              }) => ValidacionRetoGlobalsCompanion.insert(
                id: id,
                retoGlobalId: retoGlobalId,
                moderadorId: moderadorId,
                estado: estado,
                fechaValidacion: fechaValidacion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ValidacionRetoGlobalsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({retoGlobalId = false, moderadorId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (retoGlobalId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.retoGlobalId,
                                referencedTable:
                                    $$ValidacionRetoGlobalsTableReferences
                                        ._retoGlobalIdTable(db),
                                referencedColumn:
                                    $$ValidacionRetoGlobalsTableReferences
                                        ._retoGlobalIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (moderadorId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.moderadorId,
                                referencedTable:
                                    $$ValidacionRetoGlobalsTableReferences
                                        ._moderadorIdTable(db),
                                referencedColumn:
                                    $$ValidacionRetoGlobalsTableReferences
                                        ._moderadorIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ValidacionRetoGlobalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ValidacionRetoGlobalsTable,
      ValidacionRetoGlobal,
      $$ValidacionRetoGlobalsTableFilterComposer,
      $$ValidacionRetoGlobalsTableOrderingComposer,
      $$ValidacionRetoGlobalsTableAnnotationComposer,
      $$ValidacionRetoGlobalsTableCreateCompanionBuilder,
      $$ValidacionRetoGlobalsTableUpdateCompanionBuilder,
      (ValidacionRetoGlobal, $$ValidacionRetoGlobalsTableReferences),
      ValidacionRetoGlobal,
      PrefetchHooks Function({bool retoGlobalId, bool moderadorId})
    >;
typedef $$EvidenciasTableCreateCompanionBuilder =
    EvidenciasCompanion Function({
      Value<int> id,
      required int usuarioId,
      Value<int?> retoDiarioId,
      Value<int?> retoGlobalId,
      required String tipo,
      Value<String?> contenido,
      Value<DateTime> fechaSubida,
    });
typedef $$EvidenciasTableUpdateCompanionBuilder =
    EvidenciasCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<int?> retoDiarioId,
      Value<int?> retoGlobalId,
      Value<String> tipo,
      Value<String?> contenido,
      Value<DateTime> fechaSubida,
    });

final class $$EvidenciasTableReferences
    extends BaseReferences<_$AppDatabase, $EvidenciasTable, Evidencia> {
  $$EvidenciasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.evidencias.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RetoDiariosTable _retoDiarioIdTable(_$AppDatabase db) =>
      db.retoDiarios.createAlias(
        $_aliasNameGenerator(db.evidencias.retoDiarioId, db.retoDiarios.id),
      );

  $$RetoDiariosTableProcessedTableManager? get retoDiarioId {
    final $_column = $_itemColumn<int>('reto_diario_id');
    if ($_column == null) return null;
    final manager = $$RetoDiariosTableTableManager(
      $_db,
      $_db.retoDiarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_retoDiarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RetoGlobalsTable _retoGlobalIdTable(_$AppDatabase db) =>
      db.retoGlobals.createAlias(
        $_aliasNameGenerator(db.evidencias.retoGlobalId, db.retoGlobals.id),
      );

  $$RetoGlobalsTableProcessedTableManager? get retoGlobalId {
    final $_column = $_itemColumn<int>('reto_global_id');
    if ($_column == null) return null;
    final manager = $$RetoGlobalsTableTableManager(
      $_db,
      $_db.retoGlobals,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_retoGlobalIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EvidenciasTableFilterComposer
    extends Composer<_$AppDatabase, $EvidenciasTable> {
  $$EvidenciasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contenido => $composableBuilder(
    column: $table.contenido,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaSubida => $composableBuilder(
    column: $table.fechaSubida,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoDiariosTableFilterComposer get retoDiarioId {
    final $$RetoDiariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoDiarioId,
      referencedTable: $db.retoDiarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoDiariosTableFilterComposer(
            $db: $db,
            $table: $db.retoDiarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoGlobalsTableFilterComposer get retoGlobalId {
    final $$RetoGlobalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoGlobalId,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableFilterComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EvidenciasTableOrderingComposer
    extends Composer<_$AppDatabase, $EvidenciasTable> {
  $$EvidenciasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contenido => $composableBuilder(
    column: $table.contenido,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaSubida => $composableBuilder(
    column: $table.fechaSubida,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoDiariosTableOrderingComposer get retoDiarioId {
    final $$RetoDiariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoDiarioId,
      referencedTable: $db.retoDiarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoDiariosTableOrderingComposer(
            $db: $db,
            $table: $db.retoDiarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoGlobalsTableOrderingComposer get retoGlobalId {
    final $$RetoGlobalsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoGlobalId,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableOrderingComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EvidenciasTableAnnotationComposer
    extends Composer<_$AppDatabase, $EvidenciasTable> {
  $$EvidenciasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get contenido =>
      $composableBuilder(column: $table.contenido, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaSubida => $composableBuilder(
    column: $table.fechaSubida,
    builder: (column) => column,
  );

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoDiariosTableAnnotationComposer get retoDiarioId {
    final $$RetoDiariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoDiarioId,
      referencedTable: $db.retoDiarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoDiariosTableAnnotationComposer(
            $db: $db,
            $table: $db.retoDiarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RetoGlobalsTableAnnotationComposer get retoGlobalId {
    final $$RetoGlobalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.retoGlobalId,
      referencedTable: $db.retoGlobals,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RetoGlobalsTableAnnotationComposer(
            $db: $db,
            $table: $db.retoGlobals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EvidenciasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EvidenciasTable,
          Evidencia,
          $$EvidenciasTableFilterComposer,
          $$EvidenciasTableOrderingComposer,
          $$EvidenciasTableAnnotationComposer,
          $$EvidenciasTableCreateCompanionBuilder,
          $$EvidenciasTableUpdateCompanionBuilder,
          (Evidencia, $$EvidenciasTableReferences),
          Evidencia,
          PrefetchHooks Function({
            bool usuarioId,
            bool retoDiarioId,
            bool retoGlobalId,
          })
        > {
  $$EvidenciasTableTableManager(_$AppDatabase db, $EvidenciasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvidenciasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvidenciasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvidenciasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<int?> retoDiarioId = const Value.absent(),
                Value<int?> retoGlobalId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String?> contenido = const Value.absent(),
                Value<DateTime> fechaSubida = const Value.absent(),
              }) => EvidenciasCompanion(
                id: id,
                usuarioId: usuarioId,
                retoDiarioId: retoDiarioId,
                retoGlobalId: retoGlobalId,
                tipo: tipo,
                contenido: contenido,
                fechaSubida: fechaSubida,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                Value<int?> retoDiarioId = const Value.absent(),
                Value<int?> retoGlobalId = const Value.absent(),
                required String tipo,
                Value<String?> contenido = const Value.absent(),
                Value<DateTime> fechaSubida = const Value.absent(),
              }) => EvidenciasCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                retoDiarioId: retoDiarioId,
                retoGlobalId: retoGlobalId,
                tipo: tipo,
                contenido: contenido,
                fechaSubida: fechaSubida,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EvidenciasTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                usuarioId = false,
                retoDiarioId = false,
                retoGlobalId = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (usuarioId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.usuarioId,
                                    referencedTable: $$EvidenciasTableReferences
                                        ._usuarioIdTable(db),
                                    referencedColumn:
                                        $$EvidenciasTableReferences
                                            ._usuarioIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (retoDiarioId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.retoDiarioId,
                                    referencedTable: $$EvidenciasTableReferences
                                        ._retoDiarioIdTable(db),
                                    referencedColumn:
                                        $$EvidenciasTableReferences
                                            ._retoDiarioIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (retoGlobalId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.retoGlobalId,
                                    referencedTable: $$EvidenciasTableReferences
                                        ._retoGlobalIdTable(db),
                                    referencedColumn:
                                        $$EvidenciasTableReferences
                                            ._retoGlobalIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$EvidenciasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EvidenciasTable,
      Evidencia,
      $$EvidenciasTableFilterComposer,
      $$EvidenciasTableOrderingComposer,
      $$EvidenciasTableAnnotationComposer,
      $$EvidenciasTableCreateCompanionBuilder,
      $$EvidenciasTableUpdateCompanionBuilder,
      (Evidencia, $$EvidenciasTableReferences),
      Evidencia,
      PrefetchHooks Function({
        bool usuarioId,
        bool retoDiarioId,
        bool retoGlobalId,
      })
    >;
typedef $$PuntuacionsTableCreateCompanionBuilder =
    PuntuacionsCompanion Function({
      Value<int> id,
      required int usuarioId,
      Value<int> puntos,
      Value<int> racha,
    });
typedef $$PuntuacionsTableUpdateCompanionBuilder =
    PuntuacionsCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<int> puntos,
      Value<int> racha,
    });

final class $$PuntuacionsTableReferences
    extends BaseReferences<_$AppDatabase, $PuntuacionsTable, Puntuacion> {
  $$PuntuacionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.puntuacions.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PuntuacionsTableFilterComposer
    extends Composer<_$AppDatabase, $PuntuacionsTable> {
  $$PuntuacionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get puntos => $composableBuilder(
    column: $table.puntos,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get racha => $composableBuilder(
    column: $table.racha,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntuacionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PuntuacionsTable> {
  $$PuntuacionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get puntos => $composableBuilder(
    column: $table.puntos,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get racha => $composableBuilder(
    column: $table.racha,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntuacionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PuntuacionsTable> {
  $$PuntuacionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get puntos =>
      $composableBuilder(column: $table.puntos, builder: (column) => column);

  GeneratedColumn<int> get racha =>
      $composableBuilder(column: $table.racha, builder: (column) => column);

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PuntuacionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PuntuacionsTable,
          Puntuacion,
          $$PuntuacionsTableFilterComposer,
          $$PuntuacionsTableOrderingComposer,
          $$PuntuacionsTableAnnotationComposer,
          $$PuntuacionsTableCreateCompanionBuilder,
          $$PuntuacionsTableUpdateCompanionBuilder,
          (Puntuacion, $$PuntuacionsTableReferences),
          Puntuacion,
          PrefetchHooks Function({bool usuarioId})
        > {
  $$PuntuacionsTableTableManager(_$AppDatabase db, $PuntuacionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PuntuacionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PuntuacionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PuntuacionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<int> puntos = const Value.absent(),
                Value<int> racha = const Value.absent(),
              }) => PuntuacionsCompanion(
                id: id,
                usuarioId: usuarioId,
                puntos: puntos,
                racha: racha,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                Value<int> puntos = const Value.absent(),
                Value<int> racha = const Value.absent(),
              }) => PuntuacionsCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                puntos: puntos,
                racha: racha,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PuntuacionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$PuntuacionsTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$PuntuacionsTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PuntuacionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PuntuacionsTable,
      Puntuacion,
      $$PuntuacionsTableFilterComposer,
      $$PuntuacionsTableOrderingComposer,
      $$PuntuacionsTableAnnotationComposer,
      $$PuntuacionsTableCreateCompanionBuilder,
      $$PuntuacionsTableUpdateCompanionBuilder,
      (Puntuacion, $$PuntuacionsTableReferences),
      Puntuacion,
      PrefetchHooks Function({bool usuarioId})
    >;
typedef $$RankingsTableCreateCompanionBuilder =
    RankingsCompanion Function({
      Value<int> id,
      required int usuarioId,
      Value<int> puntosTotales,
      Value<int> posicion,
      Value<DateTime> fechaActualizacion,
    });
typedef $$RankingsTableUpdateCompanionBuilder =
    RankingsCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<int> puntosTotales,
      Value<int> posicion,
      Value<DateTime> fechaActualizacion,
    });

final class $$RankingsTableReferences
    extends BaseReferences<_$AppDatabase, $RankingsTable, Ranking> {
  $$RankingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) => db.usuarios
      .createAlias($_aliasNameGenerator(db.rankings.usuarioId, db.usuarios.id));

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RankingsTableFilterComposer
    extends Composer<_$AppDatabase, $RankingsTable> {
  $$RankingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get puntosTotales => $composableBuilder(
    column: $table.puntosTotales,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get posicion => $composableBuilder(
    column: $table.posicion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fechaActualizacion => $composableBuilder(
    column: $table.fechaActualizacion,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RankingsTableOrderingComposer
    extends Composer<_$AppDatabase, $RankingsTable> {
  $$RankingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get puntosTotales => $composableBuilder(
    column: $table.puntosTotales,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get posicion => $composableBuilder(
    column: $table.posicion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fechaActualizacion => $composableBuilder(
    column: $table.fechaActualizacion,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RankingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RankingsTable> {
  $$RankingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get puntosTotales => $composableBuilder(
    column: $table.puntosTotales,
    builder: (column) => column,
  );

  GeneratedColumn<int> get posicion =>
      $composableBuilder(column: $table.posicion, builder: (column) => column);

  GeneratedColumn<DateTime> get fechaActualizacion => $composableBuilder(
    column: $table.fechaActualizacion,
    builder: (column) => column,
  );

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RankingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RankingsTable,
          Ranking,
          $$RankingsTableFilterComposer,
          $$RankingsTableOrderingComposer,
          $$RankingsTableAnnotationComposer,
          $$RankingsTableCreateCompanionBuilder,
          $$RankingsTableUpdateCompanionBuilder,
          (Ranking, $$RankingsTableReferences),
          Ranking,
          PrefetchHooks Function({bool usuarioId})
        > {
  $$RankingsTableTableManager(_$AppDatabase db, $RankingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RankingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RankingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RankingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<int> puntosTotales = const Value.absent(),
                Value<int> posicion = const Value.absent(),
                Value<DateTime> fechaActualizacion = const Value.absent(),
              }) => RankingsCompanion(
                id: id,
                usuarioId: usuarioId,
                puntosTotales: puntosTotales,
                posicion: posicion,
                fechaActualizacion: fechaActualizacion,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                Value<int> puntosTotales = const Value.absent(),
                Value<int> posicion = const Value.absent(),
                Value<DateTime> fechaActualizacion = const Value.absent(),
              }) => RankingsCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                puntosTotales: puntosTotales,
                posicion: posicion,
                fechaActualizacion: fechaActualizacion,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RankingsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$RankingsTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$RankingsTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RankingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RankingsTable,
      Ranking,
      $$RankingsTableFilterComposer,
      $$RankingsTableOrderingComposer,
      $$RankingsTableAnnotationComposer,
      $$RankingsTableCreateCompanionBuilder,
      $$RankingsTableUpdateCompanionBuilder,
      (Ranking, $$RankingsTableReferences),
      Ranking,
      PrefetchHooks Function({bool usuarioId})
    >;
typedef $$NotificacionsTableCreateCompanionBuilder =
    NotificacionsCompanion Function({
      Value<int> id,
      required int usuarioId,
      required String tipo,
      required String mensaje,
      Value<DateTime> fecha,
      Value<bool> leida,
    });
typedef $$NotificacionsTableUpdateCompanionBuilder =
    NotificacionsCompanion Function({
      Value<int> id,
      Value<int> usuarioId,
      Value<String> tipo,
      Value<String> mensaje,
      Value<DateTime> fecha,
      Value<bool> leida,
    });

final class $$NotificacionsTableReferences
    extends BaseReferences<_$AppDatabase, $NotificacionsTable, Notificacion> {
  $$NotificacionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UsuariosTable _usuarioIdTable(_$AppDatabase db) =>
      db.usuarios.createAlias(
        $_aliasNameGenerator(db.notificacions.usuarioId, db.usuarios.id),
      );

  $$UsuariosTableProcessedTableManager get usuarioId {
    final $_column = $_itemColumn<int>('usuario_id')!;

    final manager = $$UsuariosTableTableManager(
      $_db,
      $_db.usuarios,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_usuarioIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$NotificacionsTableFilterComposer
    extends Composer<_$AppDatabase, $NotificacionsTable> {
  $$NotificacionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mensaje => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get leida => $composableBuilder(
    column: $table.leida,
    builder: (column) => ColumnFilters(column),
  );

  $$UsuariosTableFilterComposer get usuarioId {
    final $$UsuariosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableFilterComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificacionsTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificacionsTable> {
  $$NotificacionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mensaje => $composableBuilder(
    column: $table.mensaje,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fecha => $composableBuilder(
    column: $table.fecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get leida => $composableBuilder(
    column: $table.leida,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsuariosTableOrderingComposer get usuarioId {
    final $$UsuariosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableOrderingComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificacionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificacionsTable> {
  $$NotificacionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<String> get mensaje =>
      $composableBuilder(column: $table.mensaje, builder: (column) => column);

  GeneratedColumn<DateTime> get fecha =>
      $composableBuilder(column: $table.fecha, builder: (column) => column);

  GeneratedColumn<bool> get leida =>
      $composableBuilder(column: $table.leida, builder: (column) => column);

  $$UsuariosTableAnnotationComposer get usuarioId {
    final $$UsuariosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.usuarioId,
      referencedTable: $db.usuarios,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsuariosTableAnnotationComposer(
            $db: $db,
            $table: $db.usuarios,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$NotificacionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificacionsTable,
          Notificacion,
          $$NotificacionsTableFilterComposer,
          $$NotificacionsTableOrderingComposer,
          $$NotificacionsTableAnnotationComposer,
          $$NotificacionsTableCreateCompanionBuilder,
          $$NotificacionsTableUpdateCompanionBuilder,
          (Notificacion, $$NotificacionsTableReferences),
          Notificacion,
          PrefetchHooks Function({bool usuarioId})
        > {
  $$NotificacionsTableTableManager(_$AppDatabase db, $NotificacionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificacionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotificacionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotificacionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> usuarioId = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<String> mensaje = const Value.absent(),
                Value<DateTime> fecha = const Value.absent(),
                Value<bool> leida = const Value.absent(),
              }) => NotificacionsCompanion(
                id: id,
                usuarioId: usuarioId,
                tipo: tipo,
                mensaje: mensaje,
                fecha: fecha,
                leida: leida,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int usuarioId,
                required String tipo,
                required String mensaje,
                Value<DateTime> fecha = const Value.absent(),
                Value<bool> leida = const Value.absent(),
              }) => NotificacionsCompanion.insert(
                id: id,
                usuarioId: usuarioId,
                tipo: tipo,
                mensaje: mensaje,
                fecha: fecha,
                leida: leida,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NotificacionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({usuarioId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (usuarioId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.usuarioId,
                                referencedTable: $$NotificacionsTableReferences
                                    ._usuarioIdTable(db),
                                referencedColumn: $$NotificacionsTableReferences
                                    ._usuarioIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$NotificacionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificacionsTable,
      Notificacion,
      $$NotificacionsTableFilterComposer,
      $$NotificacionsTableOrderingComposer,
      $$NotificacionsTableAnnotationComposer,
      $$NotificacionsTableCreateCompanionBuilder,
      $$NotificacionsTableUpdateCompanionBuilder,
      (Notificacion, $$NotificacionsTableReferences),
      Notificacion,
      PrefetchHooks Function({bool usuarioId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsuariosTableTableManager get usuarios =>
      $$UsuariosTableTableManager(_db, _db.usuarios);
  $$RolsTableTableManager get rols => $$RolsTableTableManager(_db, _db.rols);
  $$UsuarioRolsTableTableManager get usuarioRols =>
      $$UsuarioRolsTableTableManager(_db, _db.usuarioRols);
  $$CuestionariosTableTableManager get cuestionarios =>
      $$CuestionariosTableTableManager(_db, _db.cuestionarios);
  $$PreguntasTableTableManager get preguntas =>
      $$PreguntasTableTableManager(_db, _db.preguntas);
  $$RespuestasTableTableManager get respuestas =>
      $$RespuestasTableTableManager(_db, _db.respuestas);
  $$PerfilsTableTableManager get perfils =>
      $$PerfilsTableTableManager(_db, _db.perfils);
  $$HistorialPerfilsTableTableManager get historialPerfils =>
      $$HistorialPerfilsTableTableManager(_db, _db.historialPerfils);
  $$RetoPredefinidosTableTableManager get retoPredefinidos =>
      $$RetoPredefinidosTableTableManager(_db, _db.retoPredefinidos);
  $$RetoDiariosTableTableManager get retoDiarios =>
      $$RetoDiariosTableTableManager(_db, _db.retoDiarios);
  $$RetoGlobalsTableTableManager get retoGlobals =>
      $$RetoGlobalsTableTableManager(_db, _db.retoGlobals);
  $$ValidacionRetoGlobalsTableTableManager get validacionRetoGlobals =>
      $$ValidacionRetoGlobalsTableTableManager(_db, _db.validacionRetoGlobals);
  $$EvidenciasTableTableManager get evidencias =>
      $$EvidenciasTableTableManager(_db, _db.evidencias);
  $$PuntuacionsTableTableManager get puntuacions =>
      $$PuntuacionsTableTableManager(_db, _db.puntuacions);
  $$RankingsTableTableManager get rankings =>
      $$RankingsTableTableManager(_db, _db.rankings);
  $$NotificacionsTableTableManager get notificacions =>
      $$NotificacionsTableTableManager(_db, _db.notificacions);
}
