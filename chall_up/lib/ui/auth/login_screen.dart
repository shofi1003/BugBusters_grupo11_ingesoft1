import 'package:flutter/material.dart';
import '../../data/database_provider.dart';   
import '../../data/daos/usuario_dao.dart';
import '../../services/google_signin_service.dart';
import '../../services/usuario_service.dart';
import './home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final correoController = TextEditingController();
  final passwordController = TextEditingController();

  String mensaje = '';
  bool cargando = false;

  late UsuarioDao usuarioDao;
  late UsuarioService usuarioService;
  late GoogleSignInService googleSignInService;

  @override
  void initState() {
    super.initState();

    // 🔥 USAR SIEMPRE LA MISMA BASE DE DATOS
    final db = DatabaseProvider.db;

    usuarioDao = UsuarioDao(db);
    usuarioService = UsuarioService(usuarioDao);
    googleSignInService = GoogleSignInService(usuarioDao);
  }

  @override
  void dispose() {
    correoController.dispose();
    passwordController.dispose();
    // 🔥 NO CERRAR LA BASE (DEBE SER GLOBAL)
    super.dispose();
  }

  Future<void> iniciarSesion() async {
    setState(() => cargando = true);

    final correo = correoController.text.trim();
    final password = passwordController.text.trim();

    final resultado = await usuarioService.iniciarSesion(correo, password);

    if (!mounted) return;
    setState(() {
      mensaje = resultado;
      cargando = false;
    });

    if (resultado == 'Inicio de sesión exitoso') {
      final usuario = await usuarioDao.obtenerUsuarioPorCorreo(correo);
      if (usuario != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(
              usuarioLogueado: usuario,
              usuarioDao: usuarioDao,
            ),
          ),
        );
      }
    }
  }

  Future<void> iniciarConGoogle() async {
    setState(() => cargando = true);

    final resultado = await googleSignInService.signIn();

    if (!mounted) return;
    setState(() {
      mensaje = resultado;
      cargando = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(resultado)));

    if (resultado.toLowerCase().contains('exitoso')) {
      final usuario = googleSignInService.usuarioLogueado;
      if (usuario != null && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(
              usuarioLogueado: usuario,
              usuarioDao: usuarioDao,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Iniciar sesión")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: correoController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Correo',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (mensaje.isNotEmpty)
              Text(
                mensaje,
                style: TextStyle(
                  color: mensaje.toLowerCase().contains('exitoso') ? Colors.green : Colors.red,
                ),
              ),
            const SizedBox(height: 18),
            cargando
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: iniciarSesion,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text("Iniciar sesión"),
                      ),
                    ),
                  ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Image.asset(
                  'assets/google_logo.png',
                  width: 20,
                  height: 20,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text("Continuar con Google"),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.grey),
                ),
                onPressed: iniciarConGoogle,
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text("Crear una cuenta"),
            )
          ],
        ),
      ),
    );
  }
}
