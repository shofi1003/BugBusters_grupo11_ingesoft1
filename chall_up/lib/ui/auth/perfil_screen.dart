import 'package:flutter/material.dart';
import '../../data/database.dart';
import '../../data/daos/usuario_dao.dart';
import 'cuestionario_inicial_screen.dart';

class PerfilScreen extends StatefulWidget {
  final Usuario usuario;      // ← ahora recibe el usuario
  final UsuarioDao usuarioDao; // ← ahora recibe el DAO ya inicializado

  const PerfilScreen({
    super.key,
    required this.usuario,
    required this.usuarioDao,
  });

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  late TextEditingController nombreCtrl;
  late TextEditingController telefonoCtrl;
  late TextEditingController passwordCtrl;

  @override
  void initState() {
    super.initState();

    // Inicializar los controladores con los datos del usuario
    nombreCtrl = TextEditingController(text: widget.usuario.nombre ?? "");
    telefonoCtrl = TextEditingController(text: widget.usuario.telefono ?? "");
    passwordCtrl = TextEditingController();
  }

  Future<void> actualizar() async {
    String nombre = nombreCtrl.text.trim();
    String telefono = telefonoCtrl.text.trim();
    String password = passwordCtrl.text.trim();

    // Validación: teléfono solo números
    if (telefono.isNotEmpty && !RegExp(r'^\d+$').hasMatch(telefono)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("El teléfono solo puede contener números")),
      );
      return;
    }

    bool ok = await widget.usuarioDao.actualizarUsuarioParcial(
      id: widget.usuario.id,
      nombre: nombre.isNotEmpty ? nombre : null,
      telefono: telefono.isNotEmpty ? telefono : null,
      password: password.isNotEmpty ? password : null,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(ok ? "Perfil actualizado" : "No se pudo actualizar"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mi Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Nombre"),
            TextField(controller: nombreCtrl),

            const SizedBox(height: 12),
            const Text("Teléfono (solo números)"),
            TextField(
              controller: telefonoCtrl,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 12),
            const Text("Nueva contraseña"),
            TextField(
              controller: passwordCtrl,
              obscureText: true,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: actualizar,
              child: const Text("Actualizar"),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CuestionarioInicialScreen(),
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
