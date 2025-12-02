import 'package:flutter/material.dart';

/// ICONOS PARA HOBBIES
final Map<String, IconData> hobbyIcons = {
  "baile": Icons.music_note,
  "fitness": Icons.fitness_center,
  "lectura": Icons.menu_book,
  "musica": Icons.audiotrack,
  "fotografia": Icons.camera_alt,
  "cocina": Icons.restaurant_menu,
  "pintura": Icons.brush,
  "videojuegos": Icons.sports_esports,
  "yoga": Icons.self_improvement,
  "senderismo": Icons.landscape,
};

/// LISTA DE HOBBIES DISPONIBLES
final List<String> hobbies = hobbyIcons.keys.toList();

/// PREGUNTAS DEPENDIENDO DEL HOBBY SELECCIONADO
Map<String, List<String>> preguntasHabitos = {
  "baile": ["Bailo 1–2 días a la semana", "Bailo 3–4 días", "Bailo 5+ días"],
  "fitness": [
    "Entreno 1–2 días",
    "Entreno 3–4 días",
    "Entreno 5–6 días"
  ],
  "lectura": [
    "Leo 1 libro al mes",
    "Leo 2–3 libros al mes",
    "Leo 4+ libros al mes"
  ],
  "musica": [
    "Practico 1–2 días",
    "Practico 3–4 días",
    "Practico 5+ días"
  ],
  "cocina": [
    "Cocino una vez por semana",
    "Cocino varias veces por semana",
    "Cocino a diario"
  ],
  "fotografia": [
    "Salgo a tomar fotos ocasionalmente",
    "Hago sesiones semanales",
    "Fotografía casi diaria"
  ],
  "pintura": [
    "Pinto ocasionalmente",
    "Pinto semanalmente",
    "Pinto varias veces a la semana"
  ],
  "videojuegos": ["Juego ocasionalmente", "Juego semanalmente", "Juego diario"],
  "yoga": ["Practico ocasionalmente", "1–2 días", "3–5 días"],
  "senderismo": ["Salgo ocasionalmente", "1 vez por semana", "2+ veces por semana"],
};

/// PREGUNTAS DE METAS DEPENDIENDO DEL HOBBY
Map<String, List<String>> preguntasMetas = {
  "baile": ["Aprender una coreografía", "Mejorar técnica", "Practicar diario"],
  "fitness": ["Ganar fuerza", "Bajar peso", "Mejorar resistencia"],
  "lectura": ["Leer más libros", "Explorar géneros nuevos", "Escribir reseñas"],
  "musica": ["Aprender canción nueva", "Mejorar técnica", "Componer algo"],
  "cocina": ["Aprender recetas nuevas", "Cocinar más seguido", "Perfeccionar técnicas"],
  "fotografia": ["Mejorar composición", "Explorar estilos nuevos", "Publicar fotos"],
  "pintura": ["Explorar estilos", "Perfeccionar técnica", "Crear una colección"],
  "videojuegos": ["Pasar un juego nuevo", "Mejorar habilidades", "Competir"],
  "yoga": ["Mejorar flexibilidad", "Meditar diario", "Aprender nuevas posturas"],
  "senderismo": ["Hacer rutas nuevas", "Aumentar resistencia", "Explorar montañas"],
};
