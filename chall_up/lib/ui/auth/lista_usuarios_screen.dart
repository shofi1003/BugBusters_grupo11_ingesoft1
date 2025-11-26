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
      appBar: AppBar(
        title: const Text("Lista de Usuarios"),
        actions: [
          IconButton(
            icon: Image.asset('assets/user_logo.png'),
            onPressed: () async {
              // Ir al perfil
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PerfilScreen(
                    usuario: widget.usuarioLogueado,
                    usuarioDao: widget.usuarioDao,
                  ),
                ),
              );

              // Recargar pantalla al volver
              setState(() {});
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Usuario>>(
        future: widget.usuarioDao.obtenerTodosUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No hay usuarios registrados"));
          }

          final usuarios = snapshot.data!;

          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final usuario = usuarios[index];

              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(usuario.nombre),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(usuario.correo),
                    if (usuario.telefono != null &&
                        usuario.telefono!.trim().isNotEmpty)
                      Text("Teléfono: ${usuario.telefono!}"),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
