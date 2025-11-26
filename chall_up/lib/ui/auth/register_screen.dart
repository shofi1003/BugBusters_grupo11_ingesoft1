import 'package:flutter/material.dart';
import '../../data/database_provider.dart';   
import '../../data/daos/usuario_dao.dart';
import '../../services/usuario_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  String mensaje = '';
  bool cargando = false;

  late UsuarioService usuarioService;

  @override
  void initState() {
    super.initState();

   
    final db = DatabaseProvider.db;
    final usuarioDao = UsuarioDao(db);

    usuarioService = UsuarioService(usuarioDao);
  }

  Future<void> registrar() async {
    setState(() => cargando = true);

    final resultado = await usuarioService.registrarUsuario(
      nombre: nombreController.text.trim(),
      correo: correoController.text.trim(),
      password: passwordController.text.trim(),
    );

    setState(() {
      mensaje = resultado;
      cargando = false;
    });

    if (resultado == 'Usuario registrado exitosamente') {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Crear cuenta")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),

            if (mensaje.isNotEmpty)
              Text(
                mensaje,
                style: TextStyle(
                  color: mensaje.contains('exitosamente')
                      ? Colors.green
                      : Colors.red,
                ),
              ),

            const SizedBox(height: 20),

            cargando
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: registrar,
                    child: const Text("Registrarse"),
                  ),
          ],
        ),
      ),
    );
  }
}
