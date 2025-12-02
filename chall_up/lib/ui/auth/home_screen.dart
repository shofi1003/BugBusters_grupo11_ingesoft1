import 'package:flutter/material.dart';
import '../../data/daos/usuario_dao.dart';
import '../../data/daos/stats_dao.dart'; // Import StatsDao
import '../../data/database.dart';
import '../../data/database_provider.dart'; // Import Provider
import 'lista_usuarios_screen.dart';
import 'perfil_stats_screen.dart'; // Import new screen
import 'perfil_screen.dart'; // Import edit screen (for the icon)
import 'cuestionario_inicial_screen.dart';

class HomeScreen extends StatelessWidget {
  final Usuario usuarioLogueado;
  final UsuarioDao usuarioDao;

  const HomeScreen({
    super.key,
    required this.usuarioLogueado,
    required this.usuarioDao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inicio - ChallUp"),
        actions: [
          IconButton(
            icon: Image.asset('assets/user_logo.png', width: 26),
            onPressed: () {
              // OPTION A: Go to Edit Profile (Old behavior)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PerfilScreen(
                    usuario: usuarioLogueado,
                    usuarioDao: usuarioDao,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // --- NEW BUTTON: View Stats/Profile ---
            ElevatedButton.icon(
              icon: const Icon(Icons.bar_chart),
              label: const Text("Ver Mi Progreso"),
              onPressed: () {
                // Get DB instance from your existing Provider
                final db = DatabaseProvider.db;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PerfilStatsScreen(
                      usuario: usuarioLogueado,
                      usuarioDao: usuarioDao,
                      statsDao: StatsDao(db), // Inject StatsDao
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),

            // Existing Buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ListaUsuarios(
                      usuarioDao: usuarioDao,
                      usuarioLogueado: usuarioLogueado,
                    ),
                  ),
                );
              },
              child: const Text("Ver lista de usuarios"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CuestionarioInicialScreen(),
                  ),
                );
              },
              child: const Text("Completar cuestionario inicial"),
            ),
          ],
        ),
      ),
    );
  }
}
