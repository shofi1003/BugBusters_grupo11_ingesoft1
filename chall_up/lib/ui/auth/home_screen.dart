import 'package:flutter/material.dart';

import '../../data/database.dart';
import '../../data/daos/usuario_dao.dart';
import '../../data/daos/perfil_dao.dart';
import '../reto/historial_retos_page.dart';
import '../reto/reto_diario_page.dart';

import 'lista_usuarios_screen.dart';
import 'perfil_screen.dart';
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
    final dao = PerfilDao(AppDatabase());
    final perfil =
    await dao.obtenerPerfilPorUsuario(widget.usuarioLogueado.id);

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

    // Cuando regrese del cuestionario volvemos a comprobar perfil
    await _cargarPerfil();
  }

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
                    usuario: widget.usuarioLogueado,
                    usuarioDao: widget.usuarioDao,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: _cargandoPerfil
            ? const CircularProgressIndicator()
            : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ListaUsuarios(
                      usuarioDao: widget.usuarioDao,
                      usuarioLogueado: widget.usuarioLogueado,
                    ),
                  ),
                );
              },
              child: const Text("Ver lista de usuarios"),
            ),
            const SizedBox(height: 20),

            /// RETO DIARIO
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RetoDiarioPage(
                      usuarioId: widget.usuarioLogueado.id,
                    ),
                  ),
                );
              },
              child: const Text("Ver reto diario de hoy"),
            ),

            /// HISTORIAL DE RETOS — ERROR CORREGIDO
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HistorialRetosPage(
                      usuarioId: widget.usuarioLogueado.id,
                    ),
                  ),
                );
              },
              child: const Text("Historial de retos"),
            ),

            const SizedBox(height: 20),

            // Solo mostramos el cuestionario si aún NO tiene perfil
            if (!_tienePerfil)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                onPressed: _abrirCuestionario,
                child: const Text("Completar cuestionario inicial"),
              )
            else
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "✨ Ya tenemos tu perfil inicial. "
                      "Pronto verás retos personalizados basados en tus hobbies.",
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
