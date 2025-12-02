import 'package:flutter/material.dart';

/// ÍCONOS opcionales por hobby — para mostrar en pantalla del reto
final hobbyIcons = {
  "leer": Icons.menu_book,
  "bailar": Icons.music_note,
  "pintar": Icons.brush,
  "cocinar": Icons.restaurant_menu,
  "correr": Icons.directions_run,
  "gimnasio": Icons.fitness_center,
  "musica": Icons.headphones,
  "fotografia": Icons.camera_alt,
  "yoga": Icons.self_improvement,
  "escribir": Icons.edit,
};

/// Gran lista de retos predefinidos por hobby
final Map<String, List<String>> retosPorHobby = {
  "leer": [
    "Lee 10 páginas de un libro que tengas pendiente.",
    "Busca un nuevo libro y añade 3 opciones a tu lista de lectura.",
    "Lee un artículo interesante durante 5 minutos.",
    "Relee tu cita favorita de un libro.",
    "Explora un género literario nuevo por 10 minutos.",
  ],
  "bailar": [
    "Aprende un paso nuevo de tu estilo favorito.",
    "Baila 3 minutos seguidos sin parar.",
    "Busca una canción nueva para bailar y practícala.",
    "Haz un mini calentamiento de baile.",
    "Graba un pequeño video bailando solo para divertirte.",
  ],
  "pintar": [
    "Haz un boceto rápido de lo primero que veas frente a ti.",
    "Explora una paleta de colores nueva.",
    "Dibuja durante 5 minutos sin levantar el lápiz.",
    "Pinta algo usando solo dos colores.",
    "Haz un dibujo abstracto y deja fluir tu creatividad.",
  ],
  "cocinar": [
    "Prueba una receta de 5 minutos hoy.",
    "Corta frutas y prepara un snack saludable.",
    "Aprende una técnica de cocina nueva en YouTube.",
    "Mejora una receta que ya conoces.",
    "Cocina algo usando solo ingredientes que tengas en casa.",
  ],
  "correr": [
    "Corre o camina rápido durante 5 minutos.",
    "Haz un estiramiento previo al running.",
    "Investiga una ruta para correr el fin de semana.",
    "Haz 10 minutos de trote suave.",
    "Haz 15 jumping jacks como calentamiento.",
  ],
  "gimnasio": [
    "Haz 10 sentadillas.",
    "Haz 10 flexiones.",
    "Estudia una rutina de entrenamiento nueva.",
    "Realiza 1 serie ligera de tu ejercicio favorito.",
    "Estira tus músculos por 5 minutos.",
  ],
  "musica": [
    "Escucha una nueva canción y analiza su ritmo.",
    "Practica un instrumento 5 minutos.",
    "Aprende un acorde o nota nueva.",
    "Escucha música relajante mientras respiras profundo.",
    "Haz una mini playlist de ánimo.",
  ],
  "fotografia": [
    "Toma una foto de algo que represente tu día.",
    "Explora un ángulo nuevo al tomar una foto.",
    "Edita una foto que tengas guardada.",
    "Haz una foto en blanco y negro.",
    "Toma una foto macro de un objeto pequeño.",
  ],
  "yoga": [
    "Haz una postura de estiramiento durante 30 segundos.",
    "Respira profundamente durante 1 minuto.",
    "Haz una mini rutina de 5 minutos.",
    "Acuéstate y relaja tu cuerpo lentamente.",
    "Practica postura del árbol por 20 segundos.",
  ],
  "escribir": [
    "Escribe 3 cosas por las que estás agradecido.",
    "Escribe una frase creativa.",
    "Describe tu día en 2 oraciones.",
    "Escribe una meta pequeña para hoy.",
    "Haz un mini poema improvisado.",
  ],
};
