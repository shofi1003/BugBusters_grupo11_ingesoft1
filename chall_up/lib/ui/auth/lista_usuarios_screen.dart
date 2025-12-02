import 'package:flutter/material.dart';
import '../../data/database.dart';
import '../../data/daos/usuario_dao.dart';
import 'perfil_screen.dart';

class ListaUsuarios extends StatefulWidget {
  final UsuarioDao usuarioDao;
  final Usuario usuarioLogueado;

  const ListaUsuarios({
    super.key,
    required this.usuarioDao,
    required this.usuarioLogueado,
  });

  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Comunidad ChallUp", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: const Icon(Icons.person, color: Colors.deepPurple),
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerfilScreen(
                    usuario: widget.usuarioLogueado,
                    usuarioDao: widget.usuarioDao,
                  ),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade900,
              Colors.deepPurple.shade700,
              Colors.deepPurple.shade500,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<List<Usuario>>(
            future: widget.usuarioDao.obtenerTodosUsuarios(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.white));
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No hay usuarios registrados", style: TextStyle(color: Colors.white)));
              }

              final usuarios = snapshot.data!;

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: usuarios.length,
                itemBuilder: (context, index) {
                  final usuario = usuarios[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.deepPurple.shade100,
                        child: Text(
                          usuario.nombre?[0].toUpperCase() ?? "U",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                        ),
                      ),
                      title: Text(
                        usuario.nombre ?? "Usuario",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.email, size: 14, color: Colors.grey),
                              const SizedBox(width: 4),
                              Text(usuario.correo, style: const TextStyle(fontSize: 13)),
                            ],
                          ),
                          if (usuario.telefono != null && usuario.telefono!.trim().isNotEmpty) ...[
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                const Icon(Icons.phone, size: 14, color: Colors.grey),
                                const SizedBox(width: 4),
                                Text(usuario.telefono!, style: const TextStyle(fontSize: 13)),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
