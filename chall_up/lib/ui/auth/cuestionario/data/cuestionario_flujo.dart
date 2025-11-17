import '../model/pregunta_model.dart';

final preguntas = <String, Pregunta>{
  "hobbies": Pregunta(
    id: "hobbies",
    titulo: "¿Qué te gusta hacer en tu tiempo libre?",
    opciones: [
      Opcion(id: "ejercicio", label: "Ejercicio", emoji: "💪", siguiente: "metas_ejercicio"),
      Opcion(id: "lectura", label: "Leer", emoji: "📚", siguiente: "metas_lectura"),
      Opcion(id: "arte", label: "Arte", emoji: "🎨", siguiente: "metas_arte"),
      Opcion(id: "videojuegos", label: "Videojuegos", emoji: "🎮", siguiente: "metas_gaming"),
      Opcion(id: "musica", label: "Música", emoji: "🎵", siguiente: "metas_musica"),
    ],
  ),

  "metas_ejercicio": Pregunta(
    id: "metas_ejercicio",
    titulo: "¿Qué buscas lograr con el ejercicio?",
    opciones: [
      Opcion(id: "bajar", label: "Bajar de peso", emoji: "⚖️"),
      Opcion(id: "musculo", label: "Ganar músculo", emoji: "💪"),
      Opcion(id: "constancia", label: "Ser constante", emoji: "⏳"),
    ],
  ),

  "metas_lectura": Pregunta(
    id: "metas_lectura",
    titulo: "¿Qué metas tienes con la lectura?",
    opciones: [
      Opcion(id: "mas", label: "Leer más seguido", emoji: "📖"),
      Opcion(id: "terminar", label: "Terminar libros pendientes", emoji: "📚"),
    ],
  ),

  // … agrega aquí metas_arte, metas_gaming, metas_musica
};
