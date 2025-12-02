import 'dart:io';
import 'package:flutter/material.dart';

import '../../data/daos/historial_retos_dao.dart';
import '../../data/database.dart';

class HistorialRetosPage extends StatefulWidget {
  final int usuarioId;

  const HistorialRetosPage({super.key, required this.usuarioId});

  @override
  State<HistorialRetosPage> createState() => _HistorialRetosPageState();
}

class _HistorialRetosPageState extends State<HistorialRetosPage>
    with SingleTickerProviderStateMixin {
  late final HistorialRetosDao _dao;
  late Future<List<RetoCompletadoConDetalle>> _futureHistorial;

  @override
  void initState() {
    super.initState();
    _dao = HistorialRetosDao(AppDatabase());
    _futureHistorial = _dao.obtenerHistorial(widget.usuarioId);
  }

  IconData _iconForHobby(String hobby) {
    hobby = hobby.toLowerCase();
    switch (hobby) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Historial de retos"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade300,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<List<RetoCompletadoConDetalle>>(
          future: _futureHistorial,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );

            if (snapshot.hasError)
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: const TextStyle(color: Colors.white),
                ),
              );

            final data = snapshot.data ?? [];

            if (data.isEmpty) {
              return const Center(
                child: Text(
                  "Aún no has completado ningún reto 😄",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                final hobby = item.perfil.hobbies ?? "Tu hobby";

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 10,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Imagen evidencia
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.file(
                          File(item.evidencia.imagenPath),
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Icon(
                              _iconForHobby(hobby),
                              size: 36,
                              color: Colors.deepPurple,
                            ),
                            const SizedBox(width: 12),

                            // Texto descripcion
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.retoBase.descripcion,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Completado el ${item.evidencia.fechaSubida.toLocal().toString().split(' ')[0]}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
