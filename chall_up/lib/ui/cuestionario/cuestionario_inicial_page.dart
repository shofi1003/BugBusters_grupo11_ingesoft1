import 'package:flutter/material.dart';
import '../../data/database.dart';
import '../../data/daos/perfil_dao.dart';
import 'cuestionario_data.dart';

class CuestionarioInicialPage extends StatefulWidget {
  final int usuarioId;

  const CuestionarioInicialPage({
    super.key,
    required this.usuarioId,
  });

  @override
  State<CuestionarioInicialPage> createState() =>
      _CuestionarioInicialPageState();
}

class _CuestionarioInicialPageState extends State<CuestionarioInicialPage>
    with SingleTickerProviderStateMixin {
  int paso = 0; // 0: hobby, 1: hábitos, 2: metas

  String? hobbySeleccionado;
  String? habitoSeleccionado;
  String? metaSeleccionada;

  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _guardarCuestionario() async {
    if (hobbySeleccionado == null ||
        habitoSeleccionado == null ||
        metaSeleccionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Por favor, responde todas las preguntas 🙈"),
        ),
      );
      return;
    }

    final dao = PerfilDao(AppDatabase());
    await dao.guardarCuestionarioInicial(
      usuarioId: widget.usuarioId,
      hobbies: hobbySeleccionado!,
      habitos: habitoSeleccionado!,
      metas: metaSeleccionada!,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("¡Gracias! Hemos creado tu perfil 🧡"),
      ),
    );

    // Volvemos al Home
    Navigator.pop(context);
  }

  void _siguientePaso() {
    if (paso == 0 && hobbySeleccionado == null) {
      _showMessage("Elige al menos un hobby para continuar ✨");
      return;
    }
    if (paso == 1 && habitoSeleccionado == null) {
      _showMessage("Cuéntanos tu frecuencia para seguir 👉");
      return;
    }

    if (paso < 2) {
      setState(() => paso++);
      _animController.forward(from: 0);
    } else {
      _guardarCuestionario();
    }
  }

  void _pasoAnterior() {
    if (paso > 0) {
      setState(() => paso--);
      _animController.forward(from: 0);
    } else {
      Navigator.pop(context);
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  String _tituloPaso() {
    switch (paso) {
      case 0:
        return "Empecemos por conocerte 💫";
      case 1:
        return "Tu estilo de vida 🧬";
      case 2:
        return "Tus metas y sueños 🎯";
      default:
        return "";
    }
  }

  String _subtituloPaso() {
    switch (paso) {
      case 0:
        return "Elige el hobby que más te identifica en este momento.";
      case 1:
        return "Queremos saber qué tan presente está en tu rutina.";
      case 2:
        return "Así podremos crear retos alineados contigo.";
      default:
        return "";
    }
  }

  Widget _buildStepper() {
    final steps = ["Hobby", "Hábitos", "Metas"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(steps.length, (index) {
        final isActive = index == paso;
        final isCompleted = index < paso;

        Color circleColor;
        Color lineColor;

        if (isCompleted) {
          circleColor = Colors.deepPurple;
          lineColor = Colors.deepPurple;
        } else if (isActive) {
          circleColor = Colors.deepPurpleAccent;
          lineColor = Colors.deepPurpleAccent;
        } else {
          circleColor = Colors.grey.shade300;
          lineColor = Colors.grey.shade400;
        }

        return Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  if (index != 0)
                    Expanded(
                      child: Container(
                        height: 3,
                        color: lineColor,
                      ),
                    ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: circleColor,
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: isCompleted || isActive
                              ? Colors.white
                              : Colors.grey.shade700,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  if (index != steps.length - 1)
                    Expanded(
                      child: Container(
                        height: 3,
                        color: lineColor,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                steps[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: isActive || isCompleted
                      ? Colors.deepPurple
                      : Colors.grey,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildContenidoPaso() {
    switch (paso) {
      case 0:
        return _buildPasoHobby();
      case 1:
        return _buildPasoHabitos();
      case 2:
        return _buildPasoMetas();
      default:
        return const SizedBox.shrink();
    }
  }

  /// PASO 0: HOBBY (ahora con GridView y scroll)
  Widget _buildPasoHobby() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "¿Qué te gusta hacer en tu tiempo libre?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: hobbies.map((hobbyId) {
              final isSelected = hobbySeleccionado == hobbyId;
              final label =
                  hobbyId[0].toUpperCase() +
                      hobbyId.substring(1); // capitalizar
              final icon = hobbyIcons[hobbyId] ?? Icons.star_border;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    hobbySeleccionado = hobbyId;
                    habitoSeleccionado = null;
                    metaSeleccionada = null;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: isSelected
                        ? LinearGradient(
                      colors: [
                        Colors.deepPurple.shade400,
                        Colors.deepPurple.shade700,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                        : const LinearGradient(
                      colors: [
                        Colors.white,
                        Color(0xFFF7F4FF),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(
                      color: isSelected
                          ? Colors.deepPurpleAccent
                          : Colors.grey.shade300,
                      width: 1.3,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        icon,
                        size: 32,
                        color: isSelected ? Colors.white : Colors.deepPurple,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        label,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// PASO 1: HÁBITOS
  Widget _buildPasoHabitos() {
    final opciones = hobbySeleccionado == null
        ? <String>[]
        : (preguntasHabitos[hobbySeleccionado!] ?? []);

    return _buildListaOpcionesBonita(
      titulo: "¿Qué tan presente está este hobby en tu vida?",
      opciones: opciones,
      seleccionado: habitoSeleccionado,
      onSelect: (op) {
        setState(() => habitoSeleccionado = op);
      },
    );
  }

  /// PASO 2: METAS
  Widget _buildPasoMetas() {
    final opciones = hobbySeleccionado == null
        ? <String>[]
        : (preguntasMetas[hobbySeleccionado!] ?? []);

    return _buildListaOpcionesBonita(
      titulo: "¿Qué te gustaría lograr con este hobby?",
      opciones: opciones,
      seleccionado: metaSeleccionada,
      onSelect: (op) {
        setState(() => metaSeleccionada = op);
      },
    );
  }

  Widget _buildListaOpcionesBonita({
    required String titulo,
    required List<String> opciones,
    required String? seleccionado,
    required Function(String) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: opciones.length,
            itemBuilder: (context, index) {
              final op = opciones[index];
              final isSelected = seleccionado == op;

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => onSelect(op),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: isSelected ? Colors.deepPurple : Colors.white,
                      border: Border.all(
                        color: isSelected
                            ? Colors.deepPurpleAccent
                            : Colors.grey.shade300,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color:
                          isSelected ? Colors.white : Colors.deepPurple,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            op,
                            style: TextStyle(
                              fontSize: 16,
                              color:
                              isSelected ? Colors.white : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool esUltimoPaso = paso == 2;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade700,
              Colors.deepPurple.shade200,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // HEADER
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: _pasoAnterior,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Cuestionario inicial",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.favorite, color: Colors.pinkAccent),
                  ],
                ),
              ),

              // STEPPER
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 8),
                child: _buildStepper(),
              ),

              // TARJETA PRINCIPAL
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    transitionBuilder: (child, animation) {
                      final offsetAnimation = Tween<Offset>(
                        begin: const Offset(0.1, 0.0),
                        end: Offset.zero,
                      ).animate(animation);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      key: ValueKey(paso),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.12),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _tituloPaso(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            _subtituloPaso(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Expanded(child: _buildContenidoPaso()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // BOTONES INFERIORES
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    if (paso > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _pasoAnterior,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                          ),
                          child: const Text("Atrás"),
                        ),
                      ),
                    if (paso > 0) const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _siguientePaso,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          esUltimoPaso ? "Guardar perfil ✨" : "Siguiente",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}