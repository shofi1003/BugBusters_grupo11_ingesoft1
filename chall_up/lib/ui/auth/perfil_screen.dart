import 'package:flutter/material.dart';
import '../../data/database.dart';
import '../../data/daos/usuario_dao.dart';
import '../cuestionario/cuestionario_inicial_page.dart'; // Ensure correct import path

class PerfilScreen extends StatefulWidget {
  final Usuario usuario;
  final UsuarioDao usuarioDao;

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
    nombreCtrl = TextEditingController(text: widget.usuario.nombre ?? "");
    telefonoCtrl = TextEditingController(text: widget.usuario.telefono ?? "");
    passwordCtrl = TextEditingController();
  }

  Future<void> actualizar() async {
    String nombre = nombreCtrl.text.trim();
    String telefono = telefonoCtrl.text.trim();
    String password = passwordCtrl.text.trim();

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
        backgroundColor: ok ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Editar Perfil", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
                child: const CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.edit, size: 40, color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Datos Personales", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                    const SizedBox(height: 20),

                    TextField(
                      controller: nombreCtrl,
                      decoration: InputDecoration(
                        labelText: "Nombre",
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      controller: telefonoCtrl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Teléfono",
                        prefixIcon: const Icon(Icons.phone_android),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),

                    TextField(
                      controller: passwordCtrl,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Nueva contraseña",
                        prefixIcon: const Icon(Icons.lock_outline),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.save),
                        label: const Text("Guardar Cambios"),
                        onPressed: actualizar,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton.icon(
                icon: const Icon(Icons.assignment),
                label: const Text("Volver a llenar cuestionario"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CuestionarioInicialPage(usuarioId: widget.usuario.id), // Fixed constructor
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
