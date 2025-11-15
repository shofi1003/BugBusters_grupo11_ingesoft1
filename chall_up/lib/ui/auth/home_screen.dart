import 'package:flutter/material.dart';
import '../../data/daos/usuario_dao.dart';
import '../../data/database.dart';
import 'lista_usuarios_screen.dart';
import 'perfil_screen.dart';
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
