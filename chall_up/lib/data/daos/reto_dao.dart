// lib/data/daos/reto_dao.dart
import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/perfil.dart';
import '../tables/reto_diario.dart';
import '../tables/reto_predefinido.dart';

part 'reto_dao.g.dart';

/// Modelo simple para exponer toda la info que necesita la UI
class RetoDiarioConDetalle {
  final RetoDiario retoDiario;
  final RetoPredefinido retoBase;
  final Perfil perfil;

  RetoDiarioConDetalle({
    required this.retoDiario,
    required this.retoBase,
    required this.perfil,
  });
}

@DriftAccessor(
  tables: [Perfils, RetoDiarios, RetoPredefinidos],
)
class RetoDao extends DatabaseAccessor<AppDatabase> with _$RetoDaoMixin {
  RetoDao(AppDatabase db) : super(db);

  /// 👉 Inserta retos predefinidos SOLO si la tabla está vacía.
  Future<void> seedRetosPredefinidosIfEmpty() async {
    final countExpr = retoPredefinidos.id.count();
    final count = await (selectOnly(retoPredefinidos)..addColumns([countExpr]))
        .map((row) => row.read(countExpr) ?? 0)
        .getSingle();

    if (count > 0) return;

    final lista = <RetoPredefinidosCompanion>[
      // EJERCICIO
      RetoPredefinidosCompanion.insert(
        categoria: 'ejercicio',
        descripcion:
        'Haz 10 minutos de estiramientos suaves para activar tu cuerpo 💪',
      ),
      RetoPredefinidosCompanion.insert(
        categoria: 'ejercicio',
        descripcion:
        'Sal a caminar 15 minutos a un ritmo tranquilo mientras escuchas tu música favorita 🎧',
      ),
      RetoPredefinidosCompanion.insert(
        categoria: 'ejercicio',
        descripcion:
        'Haz 3 series de 10 sentadillas con buena postura 🏋️‍♀️',
      ),

      // LECTURA
      RetoPredefinidosCompanion.insert(
        categoria: 'lectura',
        descripcion:
        'Lee 10 páginas de un libro que tengas pendiente 📚',
      ),
      RetoPredefinidosCompanion.insert(
        categoria: 'lectura',
        descripcion:
        'Dedica 15 minutos a leer algo que te inspire (blog, artículo, ensayo) ✨',
      ),
      RetoPredefinidosCompanion.insert(
        categoria: 'lectura',
        descripcion:
        'Haz una nota con 3 ideas que te hayan llamado la atención de lo que leas hoy 📝',
      ),

      // BAILE
      RetoPredefinidosCompanion.insert(
        categoria: 'baile',
        descripcion:
        'Pon una playlist que te guste y baila 2 canciones completas 💃',
      ),
      RetoPredefinidosCompanion.insert(
        categoria: 'baile',
        descripcion:
        'Aprende 3 pasos nuevos siguiendo un video corto de baile en internet 🎥',
      ),

      // MUSICA
      RetoPredefinidosCompanion.insert(
        categoria: 'musica',
        descripcion:
        'Escucha una canción nueva y presta atención a la letra y al ritmo 🎶',
      ),
      RetoPredefinidosCompanion.insert(
        categoria: 'musica',
        descripcion:
        'Toca o canta una canción completa, sin importar si te equivocas 🎤',
      ),

      // ARTE
      RetoPredefinidosCompanion.insert(
        categoria: 'arte',
        descripcion:
        'Dibuja o pinta durante al menos 15 minutos sin buscar perfección, solo exprésate 🎨',
      ),

      // ESCRITURA
      RetoPredefinidosCompanion.insert(
        categoria: 'escritura',
        descripcion:
        'Escribe un párrafo sobre cómo te sientes hoy, sin filtro 🖊️',
      ),
      RetoPredefinidosCompanion.insert(
        categoria: 'escritura',
        descripcion:
        'Escribe una mini historia de 5 líneas con tu hobby como protagonista 📖',
      ),

      // COCINA
      RetoPredefinidosCompanion.insert(
        categoria: 'cocina',
        descripcion:
        'Prepara una receta sencilla nueva o mejora una que ya conozcas 🍳',
      ),

      // VIDEOJUEGOS
      RetoPredefinidosCompanion.insert(
        categoria: 'videojuegos',
        descripcion:
        'Juega 20 minutos tratando de aprender una mecánica nueva o mejorar una habilidad 🎮',
      ),

      // NATURALEZA
      RetoPredefinidosCompanion.insert(
        categoria: 'naturaleza',
        descripcion:
        'Pasa al menos 15 minutos al aire libre, observando tu entorno 🌿',
      ),

      // SOCIAL / AMIGOS
      RetoPredefinidosCompanion.insert(
        categoria: 'social',
        descripcion:
        'Escribe o llama a una persona con la que no hablas hace tiempo y salúdala 💌',
      ),

      // GENERAL fallback
      RetoPredefinidosCompanion.insert(
        categoria: 'general',
        descripcion:
        'Haz una pausa consciente de 5 minutos para respirar profundo y estirarte 🌈',
      ),
    ];

    await batch((b) {
      b.insertAll(retoPredefinidos, lista);
    });
  }

  /// 👉 Devuelve el reto de hoy para el usuario.
  /// Si no existe, lo genera según su perfil (hobby).
  Future<RetoDiarioConDetalle> obtenerOGenerarRetoDiarioParaUsuario(
      int usuarioId) async {
    await seedRetosPredefinidosIfEmpty();

    // 1. Traer el perfil del usuario
    final perfil = await (select(perfils)
      ..where((p) => p.usuarioId.equals(usuarioId)))
        .getSingle();

    final hobbyTag = (perfil.hobbies ?? 'general').toLowerCase();

    // 2. Ver si ya tiene reto hoy
    final ahora = DateTime.now();
    final inicioDia = DateTime(ahora.year, ahora.month, ahora.day);
    final manana = inicioDia.add(const Duration(days: 1));

    final retosHoy = await (select(retoDiarios)
      ..where(
            (r) =>
        r.usuarioId.equals(usuarioId) &
        r.fecha.isBiggerOrEqualValue(inicioDia) &
        r.fecha.isSmallerThanValue(manana),
      ))
        .get();

    RetoDiario retoRow;

    if (retosHoy.isNotEmpty) {
      retoRow = retosHoy.first;
    } else {
      // 3. Elegir un reto predefinido según hobby
      var candidatos = await (select(retoPredefinidos)
        ..where((r) => r.categoria.equals(hobbyTag)))
          .get();

      if (candidatos.isEmpty) {
        // Fallback general
        candidatos = await (select(retoPredefinidos)
          ..where((r) => r.categoria.equals('general')))
            .get();

        if (candidatos.isEmpty) {
          candidatos = await select(retoPredefinidos).get();
        }
      }

      if (candidatos.isEmpty) {
        throw Exception('No hay retos predefinidos configurados 😢');
      }

      final idx =
          DateTime.now().millisecondsSinceEpoch % candidatos.length;
      final elegido = candidatos[idx];

      final nuevoId = await into(retoDiarios).insert(
        RetoDiariosCompanion.insert(
          usuarioId: usuarioId,
          retoPredefinidoId: elegido.id,
          fecha: ahora,
        ),
      );

      retoRow = await (select(retoDiarios)
        ..where((r) => r.id.equals(nuevoId)))
          .getSingle();
    }

    // 4. Traer detalle del reto predefinido
    final retoBase = await (select(retoPredefinidos)
      ..where((r) => r.id.equals(retoRow.retoPredefinidoId)))
        .getSingle();

    return RetoDiarioConDetalle(
      retoDiario: retoRow,
      retoBase: retoBase,
      perfil: perfil,
    );
  }

  /// 👉 Marcar reto como completado
  Future<void> marcarRetoComoCompletado(int retoDiarioId) async {
    await (update(retoDiarios)..where((r) => r.id.equals(retoDiarioId))).write(
      const RetoDiariosCompanion(
        completado: Value(true),
      ),
    );
  }
}
