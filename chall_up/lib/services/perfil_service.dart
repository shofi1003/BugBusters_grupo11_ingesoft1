// lib/services/perfil_service.dart
import '../data/database.dart';
import '../data/daos/perfil_dao.dart';
import '../data/daos/cuestionario_dao.dart';

class PerfilService {
  final AppDatabase db;
  final PerfilDao perfilDao;
  final CuestionarioDao cuestionarioDao;

  PerfilService(this.db)
      : perfilDao = PerfilDao(db),
        cuestionarioDao = CuestionarioDao(db);

  Future<void> procesarCuestionarioInicial({
    required Usuario usuario,
    required String hobbiesTexto,
    required String habitosTexto,
    required String metasTexto,
  }) async {
    // 1. Crear registro de cuestionario
    final cuestionarioId = await cuestionarioDao.crearCuestionario(usuario.id);

    // 2. Guardar preguntas/respuestas
    await cuestionarioDao.guardarRespuestas(
      usuarioId: usuario.id,
      cuestionarioId: cuestionarioId,
      respuestasPorPregunta: {
        '¿Cuáles son tus hobbies?': hobbiesTexto,
        'Describe tus hábitos diarios': habitosTexto,
        '¿Cuáles son tus metas principales?': metasTexto,
      },
    );

    // 3. Crear o actualizar perfil
    final perfilExistente =
    await perfilDao.obtenerPerfilPorUsuario(usuario.id);

    if (perfilExistente == null) {
      await perfilDao.crearPerfil(
        usuarioId: usuario.id,
        hobbies: hobbiesTexto,
        habitos: habitosTexto,
        metas: metasTexto,
      );
    } else {
      await perfilDao.actualizarPerfilYGuardarHistorial(
        usuarioId: usuario.id,
        hobbies: hobbiesTexto,
        habitos: habitosTexto,
        metas: metasTexto,
      );
    }
  }
}
