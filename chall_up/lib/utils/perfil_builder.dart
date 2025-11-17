class PerfilResumen {
  final String hobbies;
  final String habitos;
  final String metas;

  PerfilResumen({
    required this.hobbies,
    required this.habitos,
    required this.metas,
  });
}

PerfilResumen construirResumenPerfil(Map<String, String> respuestas) {
  final hobby = respuestas['hobby_principal'] ?? '';

  String hobbiesTexto = hobby;

  String metasTexto = '';
  if (hobby == 'ejercicio') metasTexto = respuestas['metas_ejercicio'] ?? '';
  if (hobby == 'lectura') metasTexto = respuestas['metas_lectura'] ?? '';
  if (hobby == 'arte') metasTexto = respuestas['metas_arte'] ?? '';
  if (hobby == 'videojuegos') metasTexto = respuestas['metas_gaming'] ?? '';
  if (hobby == 'musica') metasTexto = respuestas['metas_musica'] ?? '';

  final momento = respuestas['momento_dia'] ?? '';
  final frecuencia = respuestas['frecuencia'] ?? '';
  final nivel = respuestas['nivel_actual'] ?? '';
  final motivacion = respuestas['motivacion'] ?? '';

  final habitosPartes = [
    if (momento.isNotEmpty) 'momento:$momento',
    if (frecuencia.isNotEmpty) 'frecuencia:$frecuencia',
    if (nivel.isNotEmpty) 'nivel:$nivel',
    if (motivacion.isNotEmpty) 'motivación:$motivacion',
  ];

  return PerfilResumen(
    hobbies: hobbiesTexto,
    metas: metasTexto,
    habitos: habitosPartes.join(','),
  );
}
