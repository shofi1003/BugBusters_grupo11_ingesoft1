// lib/ui/reto/reto_diario_page.dart

import 'package:flutter/material.dart';

import '../../data/database.dart';
import '../../data/daos/reto_dao.dart';
import 'subir_evidencia_page.dart';

class RetoDiarioPage extends StatefulWidget {
  final int usuarioId;

  const RetoDiarioPage({
    super.key,
    required this.usuarioId,
  });

  @override
  State<RetoDiarioPage> createState() => _RetoDiarioPageState();
}

class _RetoDiarioPageState extends State<RetoDiarioPage>
    with SingleTickerProviderStateMixin {
  late final RetoDao _retoDao;
  late Future<RetoDiarioConDetalle> _futureReto;
  late AnimationController _animController;

  @override
  void initState() {
    super.initState();
    final db = AppDatabase();
    _retoDao = RetoDao(db);
    _futureReto =
        _retoDao.obtenerOGenerarRetoDiarioParaUsuario(widget.usuarioId);

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  IconData _iconForHobby(String hobby) {
    switch (hobby.toLowerCase()) {
      case 'ejercicio':
        return Icons.fitness_center;
      case 'lectura':
        return Icons.menu_book;
      case 'baile':
        return Icons.music_note;
      case 'musica':
        return Icons.headphones;
      case 'arte':
        return Icons.brush;
      case 'escritura':
        return Icons.edit;
      case 'cocina':
        return Icons.restaurant;
      case 'videojuegos':
        return Icons.videogame_asset;
      case 'naturaleza':
        return Icons.park;
      case 'social':
        return Icons.group;
      default:
        return Icons.star;
    }
  }

  String _labelForHobby(String hobby) {
    if (hobby.isEmpty) return 'Tu hobby';
    return hobby[0].toUpperCase() + hobby.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo degradado bonito
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade400,
              Colors.deepPurple.shade200,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Column(
              children: [
                // HEADER
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)
                      ,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Tu reto de hoy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.bolt, color: Colors.amberAccent),
                  ],
                ),
                const SizedBox(height: 12),

                // CONTENIDO
                Expanded(
                  child: FutureBuilder<RetoDiarioConDetalle>(
                    future: _futureReto,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Ups, hubo un problema cargando tu reto 😢\n${snapshot.error}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: Text(
                            'No se encontró un reto para hoy.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }

                      final reto = snapshot.data!;
                      final hobby = (reto.perfil.hobbies ?? 'general');
                      final icon = _iconForHobby(hobby);
                      final hobbyLabel = _labelForHobby(hobby);
                      final completado = reto.retoDiario.completado;

                      return FadeTransition(
                        opacity: CurvedAnimation(
                            parent: _animController, curve: Curves.easeIn),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.08),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: _animController,
                            curve: Curves.easeOut,
                          )),
                          child: Column(
                            children: [
                              // Tarjeta principal del reto
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(26),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.18),
                                        blurRadius: 18,
                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(14),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.deepPurple.shade50,
                                            ),
                                            child: Icon(
                                              icon,
                                              size: 32,
                                              color: Colors.deepPurple,
                                            ),
                                          ),
                                          const SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                hobbyLabel,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.deepPurple,
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                completado
                                                    ? "Reto completado hoy 🎉"
                                                    : "Reto inspirado en tu perfil",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey.shade700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Icon(
                                            completado
                                                ? Icons.check_circle
                                                : Icons.circle_outlined,
                                            color: completado
                                                ? Colors.green
                                                : Colors.grey.shade400,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 24),

                                      const Text(
                                        "Tu misión de hoy",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // Descripción del reto
                                      Text(
                                        reto.retoBase.descripcion,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          height: 1.4,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 24),

                                      const Text(
                                        "Tip",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.deepPurple,
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        "Cuando termines, súbenos tu evidencia y marcaremos tu reto como completado ✨",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade700,
                                        ),
                                      ),
                                      const Spacer(),

                                      // ────────────────────────────────
                                      // NUEVO BOTÓN: SUBIR EVIDENCIA
                                      // ────────────────────────────────
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton.icon(
                                          onPressed: completado
                                              ? null
                                              : () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    SubirEvidenciaPage(
                                                      usuarioId:
                                                      widget.usuarioId,
                                                      reto: reto,
                                                    ),
                                              ),
                                            ).then((_) {
                                              setState(() {
                                                _futureReto = _retoDao
                                                    .obtenerOGenerarRetoDiarioParaUsuario(
                                                    widget.usuarioId);
                                              });
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: completado
                                                ? Colors.grey.shade300
                                                : Colors.deepPurple,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 14),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(18),
                                            ),
                                          ),
                                          icon: Icon(
                                            completado
                                                ? Icons.check_circle
                                                : Icons.upload,
                                          ),
                                          label: Text(
                                            completado
                                                ? "Reto completado 🎉"
                                                : "Subir evidencia",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 18),

                              // Frase motivacional
                              Text(
                                "Un pequeño paso hoy es un gran avance para tu versión futura 🌱",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
