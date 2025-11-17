// lib/utils/cuestionario_flow.dart

/// Dado un hobby principal, devuelve el id de la siguiente pregunta de metas.
/// Si el hobby no coincide, va a una pregunta genérica: 'momento_dia'.
String siguientePreguntaSegunHobby(String hobbyId) {
  switch (hobbyId) {
    case 'ejercicio':
      return 'metas_ejercicio';
    case 'lectura':
      return 'metas_lectura';
    case 'arte':
      return 'metas_arte';
    case 'videojuegos':
      return 'metas_gaming';
    case 'musica':
      return 'metas_musica';
    default:
      return 'momento_dia';
  }
}
