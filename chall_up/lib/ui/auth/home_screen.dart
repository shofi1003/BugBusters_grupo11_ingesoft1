import 'package:flutter/material.dart';

import '../../data/database.dart';
import '../../data/database_provider.dart';
import '../../data/daos/usuario_dao.dart';
import '../../data/daos/perfil_dao.dart';
import '../../data/daos/stats_dao.dart';
import '../reto/historial_retos_page.dart';
import '../reto/reto_diario_page.dart';

import 'lista_usuarios_screen.dart';
import 'perfil_screen.dart';
import 'perfil_stats_screen.dart';
import '../cuestionario/cuestionario_inicial_page.dart';

class HomeScreen extends StatefulWidget {
  final Usuario usuarioLogueado;
  final UsuarioDao usuarioDao;

  const HomeScreen({
    super.key,
    required this.usuarioLogueado,
    required this.usuarioDao,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _tienePerfil = false;
  bool _cargandoPerfil = true;

  @override
  void initState() {
    super.initState();
    _cargarPerfil();
  }

  Future<void> _cargarPerfil() async {
    final dao = PerfilDao(DatabaseProvider.db);
    final perfil = await dao.obtenerPerfilPorUsuario(widget.usuarioLogueado.id);

    if (!mounted) return;
    setState(() {
      _tienePerfil = perfil != null;
      _cargandoPerfil = false;
    });
  }

  Future<void> _abrirCuestionario() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CuestionarioInicialPage(
          usuarioId: widget.usuarioLogueado.id,
        ),
      ),
    );
    await _cargarPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Background Gradient consistent with other pages
      body: Container(
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
        child: SafeArea(
          child: _cargandoPerfil
              ? const Center(child: CircularProgressIndicator(color: Colors.white))
              : Column(
            children: [
              _buildCustomAppBar(context),
              const SizedBox(height: 10),

              // 2. Initial Questionnaire Banner (Only visible if profile is missing)
              if (!_tienePerfil) _buildPendingSetupCard(),
              if (_tienePerfil) _buildWelcomeText(),

              const SizedBox(height: 20),

              // 3. The Dashboard Grid (4 Icons)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.0, // Square cards
                    children: [
                      _buildMenuCard(
                        icon: Icons.bolt,
                        label: "Reto Diario",
                        color: Colors.amber,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RetoDiarioPage(
                              usuarioId: widget.usuarioLogueado.id,
                            ),
                          ),
                        ),
                      ),
                      _buildMenuCard(
                        icon: Icons.history,
                        label: "Historial",
                        color: Colors.greenAccent.shade700,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HistorialRetosPage(
                              usuarioId: widget.usuarioLogueado.id,
                            ),
                          ),
                        ),
                      ),
                      _buildMenuCard(
                        icon: Icons.bar_chart,
                        label: "Mi Progreso",
                        color: Colors.blueAccent,
                        onTap: () {
                          final db = DatabaseProvider.db;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PerfilStatsScreen(
                                usuario: widget.usuarioLogueado,
                                usuarioDao: widget.usuarioDao,
                                statsDao: StatsDao(db),
                              ),
                            ),
                          );
                        },
                      ),
                      _buildMenuCard(
                        icon: Icons.group,
                        label: "Comunidad",
                        color: Colors.pinkAccent,
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ListaUsuarios(
                              usuarioDao: widget.usuarioDao,
                              usuarioLogueado: widget.usuarioLogueado,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // --- Custom Widgets ---

  Widget _buildCustomAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ChallUp",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Mejora cada día",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PerfilScreen(
                    usuario: widget.usuarioLogueado,
                    usuarioDao: widget.usuarioDao,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/user_logo.png', width: 28),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 32,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPendingSetupCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.amber),
      ),
      child: Column(
        children: [
          const Text(
            "⚠️ Perfil Incompleto",
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Para generar retos personalizados, necesitamos conocer tus hobbies.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            onPressed: _abrirCuestionario,
            child: const Text("Completar ahora"),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeText() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Text(
        "¡Bienvenido de nuevo! Selecciona una opción para empezar.",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }
}