// lib/ui/auth/cuestionario_inicial_screen.dart
import 'package:flutter/material.dart';
import '../../data/database.dart';
import '../../data/daos/usuario_dao.dart';
import '../../data/daos/perfil_dao.dart';
import '../../data/daos/cuestionario_dao.dart';

class CuestionarioInicialScreen extends StatefulWidget {
  final Usuario usuario;
  final UsuarioDao usuarioDao;

  const CuestionarioInicialScreen({
    super.key,
    required this.usuario,
    required this.usuarioDao,
  });

  @override
  State<CuestionarioInicialScreen> createState() =>
      _CuestionarioInicialScreenState();
}

class _CuestionarioInicialScreenState extends State<CuestionarioInicialScreen> {
  final AppDatabase _db = AppDatabase();

  late final PerfilDao _perfilDao;
  late final CuestionarioDao _cuestionarioDao;

  String _preguntaActualId = 'hobby_principal';
  final Map<String, String> _respuestas = {};
  bool _guardando = false;

  @override
  void initState() {
    super.initState();
    _perfilDao = PerfilDao(_db);
    _cuestionarioDao = CuestionarioDao(_db);
  }

  // ==== MODELO DE PREGUNTAS INTELIGENTES ====

  QuestionNode _getPregunta(String id) => _questionMap[id]!;

  void _onOpcionSeleccionada(AnswerOption opcion, QuestionNode pregunta) {
    if (_guardando) return;

    setState(() {
      _respuestas[pregunta.id] = opcion.id;
    });

    final String? siguiente =
        opcion.nextId ?? pregunta.defaultNextId;

    if (siguiente == null || siguiente == 'final') {
      _finalizarCuestionario();
    } else {
      setState(() {
        _preguntaActualId = siguiente;
      });
    }
  }

  Future<void> _finalizarCuestionario() async {
    setState(() {
      _guardando = true;
    });

    try {
      // 1. Convertir respuestas a textos visibles (para guardar en la BD)
      final Map<String, String> preguntasYRespuestas = {};
      for (final entry in _respuestas.entries) {
        final q = _questionMap[entry.key]!;
        final opt = q.options.firstWhere((o) => o.id == entry.value);
        preguntasYRespuestas[q.title] = opt.label;
      }

      // 2. Construir strings para perfil (hobbies, hábitos, metas)
      final resumen = _construirResumenPerfil(_respuestas);

      // 3. Guardar cuestionario en tablas Cuestionarios / Preguntas / Respuestas
      await _cuestionarioDao.guardarPreguntasYRespuestas(
        usuarioId: widget.usuario.id,
        preguntasYRespuestas: preguntasYRespuestas,
      );

      // 4. Crear o actualizar perfil en tabla Perfils + historial
      await _perfilDao.crearOActualizarPerfil(
        usuarioId: widget.usuario.id,
        hobbies: resumen.hobbies,
        habitos: resumen.habitos,
        metas: resumen.metas,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('¡Gracias! Hemos creado tu perfil personalizado 💙'),
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar cuestionario: $e'),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _guardando = false;
        });
      }
    }
  }

  PerfilResumen _construirResumenPerfil(Map<String, String> respuestas) {
    // HOBBIES
    final hobbyId = respuestas['hobby_principal'];
    String hobbiesTexto = '';
    if (hobbyId != null) {
      final opt = _questionMap['hobby_principal']!
          .options
          .firstWhere((o) => o.id == hobbyId);
      hobbiesTexto = opt.label;
    }

    // METAS según hobby
    String metasTexto = '';
    if (hobbyId == 'ejercicio') {
      metasTexto = _labelDeRespuesta('metas_ejercicio');
    } else if (hobbyId == 'lectura') {
      metasTexto = _labelDeRespuesta('metas_lectura');
    } else if (hobbyId == 'arte') {
      metasTexto = _labelDeRespuesta('metas_arte');
    } else if (hobbyId == 'videojuegos') {
      metasTexto = _labelDeRespuesta('metas_gaming');
    } else if (hobbyId == 'musica') {
      metasTexto = _labelDeRespuesta('metas_musica');
    }

    // HÁBITOS: combinamos momento del día, frecuencia, nivel, motivación
    final momento = _labelDeRespuesta('momento_dia');
    final frecuencia = _labelDeRespuesta('frecuencia');
    final nivel = _labelDeRespuesta('nivel_actual');
    final motivacion = _labelDeRespuesta('motivacion');

    final partesHabitos = [
      if (momento.isNotEmpty) 'Prefiere hacer sus hábitos en: $momento',
      if (frecuencia.isNotEmpty) 'Frecuencia deseada: $frecuencia',
      if (nivel.isNotEmpty) 'Nivel actual: $nivel',
      if (motivacion.isNotEmpty) 'Principal motivación: $motivacion',
    ];
    final habitosTexto = partesHabitos.join(' | ');

    return PerfilResumen(
      hobbies: hobbiesTexto,
      habitos: habitosTexto,
      metas: metasTexto,
    );
  }

  String _labelDeRespuesta(String preguntaId) {
    final respId = _respuestas[preguntaId];
    if (respId == null) return '';
    final q = _questionMap[preguntaId];
    if (q == null) return '';
    final opt = q.options.where((o) => o.id == respId);
    if (opt.isEmpty) return '';
    return opt.first.label;
  }

  @override
  Widget build(BuildContext context) {
    final question = _getPregunta(_preguntaActualId);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7F5AF0), Color(0xFF2CB67D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildTopBar(),
              const SizedBox(height: 16),
              _buildProgressIndicator(),
              const SizedBox(height: 16),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, anim) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.1, 0),
                        end: Offset.zero,
                      ).animate(anim),
                      child: FadeTransition(
                        opacity: anim,
                        child: child,
                      ),
                    );
                  },
                  child: _buildQuestionCard(question),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: Row(
        children: const [
          Icon(Icons.bolt, color: Colors.white, size: 28),
          SizedBox(width: 8),
          Text(
            "Queremos conocerte mejor ✨",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  int _indexPreguntaActual() {
    final orden = _orderedIds;
    final idx = orden.indexOf(_preguntaActualId);
    if (idx == -1) return 0;
    return idx;
  }

  int _totalPreguntas() => _orderedIds.length;

  Widget _buildProgressIndicator() {
    final total = _totalPreguntas();
    final index = _indexPreguntaActual();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: LinearProgressIndicator(
              value: (index + 1) / total,
              backgroundColor: Colors.white.withOpacity(0.2),
              color: Colors.white,
              minHeight: 6,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${index + 1}/$total',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(QuestionNode question) {
    return Padding(
      key: ValueKey(question.id),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (question.subtitle != null) ...[
                const SizedBox(height: 8),
                Text(
                  question.subtitle!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: question.options.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final opt = question.options[index];
                    final seleccionada = _respuestas[question.id] == opt.id;
                    return _buildOptionTile(
                      opt,
                      seleccionada,
                      onTap: () => _onOpcionSeleccionada(opt, question),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(
      AnswerOption option,
      bool seleccionado, {
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: _guardando ? null : onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: seleccionado
              ? const Color(0xFF2CB67D).withOpacity(0.15)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: seleccionado
                ? const Color(0xFF2CB67D)
                : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Text(option.emoji, style: const TextStyle(fontSize: 26)),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option.label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (seleccionado)
                const Icon(Icons.check_circle, color: Color(0xFF2CB67D))
              else
                const Icon(Icons.circle_outlined, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

// ==== MODELO Y DEFINICIÓN DEL CUESTIONARIO INTELIGENTE ====

class QuestionNode {
  final String id;
  final String title;
  final String? subtitle;
  final List<AnswerOption> options;
  final String? defaultNextId;

  QuestionNode({
    required this.id,
    required this.title,
    this.subtitle,
    required this.options,
    this.defaultNextId,
  });
}

class AnswerOption {
  final String id;
  final String label;
  final String emoji;
  final String? nextId;

  AnswerOption({
    required this.id,
    required this.label,
    required this.emoji,
    this.nextId,
  });
}

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

// Orden básico para la barra de progreso
final List<String> _orderedIds = [
  'hobby_principal',
  'metas_ejercicio',
  'metas_lectura',
  'metas_arte',
  'metas_gaming',
  'metas_musica',
  'momento_dia',
  'frecuencia',
  'nivel_actual',
  'motivacion',
];

// Definición de todas las pantallas de preguntas
final Map<String, QuestionNode> _questionMap = {
  'hobby_principal': QuestionNode(
    id: 'hobby_principal',
    title: '¿Qué te gusta hacer en tu tiempo libre?',
    subtitle: 'Esto nos ayuda a proponerte retos que realmente disfrutes 💜',
    defaultNextId: null,
    options: [
      AnswerOption(
        id: 'ejercicio',
        label: 'Hacer ejercicio o deporte',
        emoji: '💪',
        nextId: 'metas_ejercicio',
      ),
      AnswerOption(
        id: 'lectura',
        label: 'Leer libros, blogs o artículos',
        emoji: '📚',
        nextId: 'metas_lectura',
      ),
      AnswerOption(
        id: 'arte',
        label: 'Dibujar, pintar, crear arte',
        emoji: '🎨',
        nextId: 'metas_arte',
      ),
      AnswerOption(
        id: 'videojuegos',
        label: 'Jugar videojuegos',
        emoji: '🎮',
        nextId: 'metas_gaming',
      ),
      AnswerOption(
        id: 'musica',
        label: 'Escuchar o tocar música',
        emoji: '🎵',
        nextId: 'metas_musica',
      ),
    ],
  ),

  // METAS según hobby
  'metas_ejercicio': QuestionNode(
    id: 'metas_ejercicio',
    title: '¿Qué te gustaría lograr con el ejercicio?',
    subtitle: 'No hay respuestas correctas, solo tus metas 💚',
    defaultNextId: 'momento_dia',
    options: [
      AnswerOption(
        id: 'bajar_peso',
        label: 'Bajar de peso y sentirme más liger@',
        emoji: '⚖️',
      ),
      AnswerOption(
        id: 'ganar_musculo',
        label: 'Ganar fuerza y músculo',
        emoji: '🏋️‍♀️',
      ),
      AnswerOption(
        id: 'ser_constante',
        label: 'Lograr ser constante con el hábito',
        emoji: '⏳',
      ),
      AnswerOption(
        id: 'salud_general',
        label: 'Mejorar mi salud en general',
        emoji: '💓',
      ),
    ],
  ),

  'metas_lectura': QuestionNode(
    id: 'metas_lectura',
    title: '¿Qué te gustaría lograr con la lectura?',
    defaultNextId: 'momento_dia',
    options: [
      AnswerOption(
        id: 'leer_mas',
        label: 'Leer más seguido',
        emoji: '📖',
      ),
      AnswerOption(
        id: 'terminar_pendientes',
        label: 'Terminar libros pendientes',
        emoji: '📚',
      ),
      AnswerOption(
        id: 'explorar_generos',
        label: 'Explorar nuevos géneros',
        emoji: '🧠',
      ),
      AnswerOption(
        id: 'relajarme',
        label: 'Usarlo como momento de desconexión',
        emoji: '🛋️',
      ),
    ],
  ),

  'metas_arte': QuestionNode(
    id: 'metas_arte',
    title: '¿Qué te gustaría lograr con el arte?',
    defaultNextId: 'momento_dia',
    options: [
      AnswerOption(
        id: 'mejorar_habilidad',
        label: 'Mejorar mis habilidades artísticas',
        emoji: '🎨',
      ),
      AnswerOption(
        id: 'expresarme',
        label: 'Expresarme mejor',
        emoji: '✨',
      ),
      AnswerOption(
        id: 'relajarme',
        label: 'Relajarme y soltar estrés',
        emoji: '🧘‍♀️',
      ),
    ],
  ),

  'metas_gaming': QuestionNode(
    id: 'metas_gaming',
    title: '¿Qué buscas al jugar videojuegos?',
    defaultNextId: 'momento_dia',
    options: [
      AnswerOption(
        id: 'diversion',
        label: 'Divertirme y desconectar',
        emoji: '🎮',
      ),
      AnswerOption(
        id: 'competitivo',
        label: 'Ser más competitivo',
        emoji: '🏆',
      ),
      AnswerOption(
        id: 'social',
        label: 'Compartir tiempo con amigos',
        emoji: '👥',
      ),
    ],
  ),

  'metas_musica': QuestionNode(
    id: 'metas_musica',
    title: '¿Qué lugar ocupa la música en tu vida?',
    defaultNextId: 'momento_dia',
    options: [
      AnswerOption(
        id: 'relajarme',
        label: 'Me ayuda a relajarme',
        emoji: '🎧',
      ),
      AnswerOption(
        id: 'concentrarme',
        label: 'La uso para concentrarme',
        emoji: '🧠',
      ),
      AnswerOption(
        id: 'expresion',
        label: 'Es mi forma de expresarme',
        emoji: '🎤',
      ),
    ],
  ),

  // Preguntas generales de hábitos
  'momento_dia': QuestionNode(
    id: 'momento_dia',
    title: '¿En qué momento del día prefieres construir tus hábitos?',
    defaultNextId: 'frecuencia',
    options: [
      AnswerOption(
        id: 'manana',
        label: 'En la mañana',
        emoji: '🌅',
      ),
      AnswerOption(
        id: 'tarde',
        label: 'En la tarde',
        emoji: '🌇',
      ),
      AnswerOption(
        id: 'noche',
        label: 'En la noche',
        emoji: '🌙',
      ),
    ],
  ),

  'frecuencia': QuestionNode(
    id: 'frecuencia',
    title: '¿Con qué frecuencia te gustaría trabajar en tus hábitos?',
    defaultNextId: 'nivel_actual',
    options: [
      AnswerOption(
        id: 'todos_dias',
        label: 'Todos los días',
        emoji: '📆',
      ),
      AnswerOption(
        id: '3_4',
        label: '3-4 veces por semana',
        emoji: '📅',
      ),
      AnswerOption(
        id: '1_2',
        label: '1-2 veces por semana',
        emoji: '🗓️',
      ),
    ],
  ),

  'nivel_actual': QuestionNode(
    id: 'nivel_actual',
    title: '¿Cómo te sientes con tu nivel actual de hábitos?',
    defaultNextId: 'motivacion',
    options: [
      AnswerOption(
        id: 'principiante',
        label: 'Voy empezando',
        emoji: '🌱',
      ),
      AnswerOption(
        id: 'intermedio',
        label: 'Voy en modo intermedio',
        emoji: '🌿',
      ),
      AnswerOption(
        id: 'avanzado',
        label: 'Me siento bastante avanzad@',
        emoji: '🌳',
      ),
    ],
  ),

  'motivacion': QuestionNode(
    id: 'motivacion',
    title: '¿Qué te motiva más a mejorar tus hábitos?',
    defaultNextId: 'final',
    options: [
      AnswerOption(
        id: 'salud',
        label: 'Cuidar mi salud',
        emoji: '💓',
      ),
      AnswerOption(
        id: 'energia',
        label: 'Tener más energía',
        emoji: '⚡',
      ),
      AnswerOption(
        id: 'autoestima',
        label: 'Sentirme orgullos@ de mí',
        emoji: '🌟',
      ),
      AnswerOption(
        id: 'productividad',
        label: 'Ser más productiv@',
        emoji: '📈',
      ),
    ],
  ),
};
