class Pregunta {
  final String id;
  final String titulo;
  final List<Opcion> opciones;
  final String? siguienteSegunOpcion; // null = ir a la siguiente normal

  Pregunta({
    required this.id,
    required this.titulo,
    required this.opciones,
    this.siguienteSegunOpcion,
  });
}

class Opcion {
  final String id;
  final String label;
  final String emoji; // para hacerlo divertido
  final String? siguiente; // hacia cuál pregunta va

  Opcion({
    required this.id,
    required this.label,
    required this.emoji,
    this.siguiente,
  });
}
