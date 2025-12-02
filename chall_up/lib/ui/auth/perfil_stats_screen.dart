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
      appBar: AppBar(
        title: const Text("Mi Progreso"),
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
      body: FutureBuilder<Map<String, dynamic>>(
        future: _statsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data ?? {};
          final bool esAdmin = data['esAdmin'] ?? false;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(widget.usuario.nombre ?? "Usuario"),
                const SizedBox(height: 20),
                _buildStatsGrid(data),
                const SizedBox(height: 20),
                _buildWeeklyProgress(data['progresoSemanal'] ?? 0.0),
                const SizedBox(height: 20),

                if (esAdmin) ...[
                  const Divider(),
                  const Text("🛡️ Panel Admin", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
                  const SizedBox(height: 10),
                  Card(
                    color: Colors.red[50],
                    child: ListTile(
                      title: const Text("Total Usuarios Registrados"),
                      trailing: Text("${data['totalUsuarios']}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],

                const Divider(),
                const Text("🏆 Top 5 Ranking", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                _buildRankingList(data['topRanking'] ?? []),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(String name) {
    return Row(
      children: [
        const CircleAvatar(radius: 35, child: Icon(Icons.person, size: 35)),
        const SizedBox(width: 15),
        Text(name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStatsGrid(Map<String, dynamic> data) {
    return Row(
      children: [
        Expanded(child: _statCard("Puntos", "${data['puntos']}", Colors.amber)),
        const SizedBox(width: 8),
        Expanded(child: _statCard("Racha", "${data['racha']} días", Colors.orange)),
        const SizedBox(width: 8),
        Expanded(child: _statCard("Retos", "${data['totalCompletados']}", Colors.blue)),
      ],
    );
  }

  Widget _statCard(String label, String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          Text(label, style: const TextStyle(fontSize: 12)),
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
            const Text("Progreso Semanal", style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${(value * 100).toInt()}%"),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: value, minHeight: 10, borderRadius: BorderRadius.circular(5)),
      ],
    );
  }

  Widget _buildRankingList(List<drift.TypedResult> ranking) {
    if (ranking.isEmpty) return const Text("No hay datos disponibles.");
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: ranking.length,
      itemBuilder: (context, index) {
        final row = ranking[index];
        // Read the tables from the row. We use the DAO db reference logic indirectly here.
        // Assuming 'Ranking' and 'Usuario' are the data classes generated by drift.
        final usuario = row.readTable(widget.statsDao.db.usuarios);
        final rank = row.readTable(widget.statsDao.db.rankings);

        return ListTile(
          leading: CircleAvatar(
            backgroundColor: index == 0 ? Colors.amber : Colors.grey[300],
            child: Text("#${index + 1}"),
          ),
          title: Text(usuario.nombre ?? "Anónimo"),
          trailing: Text("${rank.puntosTotales} pts"),
        );
      },
    );
  }
}