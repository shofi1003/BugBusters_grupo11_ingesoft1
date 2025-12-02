import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../../data/database.dart';
import '../../data/daos/stats_dao.dart';
import '../../data/daos/usuario_dao.dart';
import 'perfil_screen.dart';

class PerfilStatsScreen extends StatefulWidget {
  final Usuario usuario;
  final UsuarioDao usuarioDao;
  final StatsDao statsDao;

  const PerfilStatsScreen({
    super.key,
    required this.usuario,
    required this.usuarioDao,
    required this.statsDao,
  });

  @override
  State<PerfilStatsScreen> createState() => _PerfilStatsScreenState();
}

class _PerfilStatsScreenState extends State<PerfilStatsScreen> {
  late Future<Map<String, dynamic>> _statsFuture;

  @override
  void initState() {
    super.initState();
    _statsFuture = _loadStats();
  }

  Future<Map<String, dynamic>> _loadStats() async {
    final puntuacion = await widget.statsDao.obtenerPuntuacionUsuario(widget.usuario.id);
    final totalCompletados = await widget.statsDao.contarRetosCompletados(widget.usuario.id);
    final progresoSemanal = await widget.statsDao.obtenerProgresoSemanal(widget.usuario.id);
    final topRanking = await widget.statsDao.obtenerTopRanking();
    final esAdmin = await widget.statsDao.esAdmin(widget.usuario.id);

    int totalUsuarios = 0;
    if (esAdmin) {
      totalUsuarios = await widget.statsDao.contarTotalUsuarios();
    }

    return {
      'puntos': puntuacion?.puntos ?? 0,
      'racha': puntuacion?.racha ?? 0,
      'totalCompletados': totalCompletados,
      'progresoSemanal': progresoSemanal,
      'topRanking': topRanking,
      'esAdmin': esAdmin,
      'totalUsuarios': totalUsuarios,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Mi Progreso",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: "Editar Perfil",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PerfilScreen(
                    usuario: widget.usuario,
                    usuarioDao: widget.usuarioDao,
                  ),
                ),
              );
            },
          )
        ],
      ),
      // USE STACK HERE TO FIX BACKGROUND
      body: Stack(
        children: [
          // 1. FIXED BACKGROUND LAYER
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade900,
                  Colors.deepPurple.shade700,
                  Colors.deepPurple.shade400,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // 2. SCROLLABLE CONTENT LAYER
          SafeArea(
            child: FutureBuilder<Map<String, dynamic>>(
              future: _statsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(color: Colors.white));
                }

                final data = snapshot.data ?? {};
                final bool esAdmin = data['esAdmin'] ?? false;

                return SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ... (Rest of your widgets: Header, Grid, etc.) ...
                      _buildHeader(widget.usuario.nombre ?? "Usuario"),
                      const SizedBox(height: 24),

                      _buildStatsGrid(data),
                      const SizedBox(height: 20),

                      _buildSectionContainer(
                        child: _buildWeeklyProgress(data['progresoSemanal'] ?? 0.0),
                      ),
                      const SizedBox(height: 20),

                      if (esAdmin) ...[
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "🛡️ Panel Admin",
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                              const Divider(color: Colors.redAccent),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: const Text("Total Usuarios Registrados"),
                                trailing: Text(
                                  "${data['totalUsuarios']}",
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],

                      _buildSectionContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "🏆 Top 5 Ranking",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                            ),
                            const SizedBox(height: 10),
                            _buildRankingList(data['topRanking'] ?? []),
                          ],
                        ),
                      ),
                      // Add extra space at bottom for scrolling comfort
                      const SizedBox(height: 40),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildHeader(String name) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(Map<String, dynamic> data) {
    return Row(
      children: [
        Expanded(child: _statCard("Puntos", "${data['puntos']}", Colors.amber)),
        const SizedBox(width: 12),
        Expanded(child: _statCard("Racha", "${data['racha']} días", Colors.orange)),
        const SizedBox(width: 12),
        Expanded(child: _statCard("Retos", "${data['totalCompletados']}", Colors.blue)),
      ],
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
              value,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)
          ),
          const SizedBox(height: 4),
          Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600)
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyProgress(double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Progreso Semanal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              "${(value * 100).toInt()}%",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: value,
            minHeight: 12,
            backgroundColor: Colors.grey.shade200,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
      ],
    );
  }

  Widget _buildRankingList(List<drift.TypedResult> ranking) {
    if (ranking.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text("No hay datos disponibles aún."),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ranking.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final row = ranking[index];
        final usuario = row.readTable(widget.statsDao.db.usuarios);
        final rank = row.readTable(widget.statsDao.db.rankings);

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: index == 0 ? Colors.amber : Colors.grey.shade200,
            foregroundColor: index == 0 ? Colors.white : Colors.black87,
            child: Text("#${index + 1}"),
          ),
          title: Text(usuario.nombre ?? "Anónimo", style: const TextStyle(fontWeight: FontWeight.w500)),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "${rank.puntosTotales} pts",
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
            ),
          ),
        );
      },
    );
  }
}