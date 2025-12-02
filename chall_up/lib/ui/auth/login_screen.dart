import 'package:flutter/material.dart';
import '../../data/database_provider.dart';
import '../../data/daos/usuario_dao.dart';
import '../../services/google_signin_service.dart';
import '../../services/usuario_service.dart';
import './home_screen.dart';
import 'register_screen.dart'; // Ensure import is correct

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
    final db = DatabaseProvider.db;
    usuarioDao = UsuarioDao(db);
    usuarioService = UsuarioService(usuarioDao);
    googleSignInService = GoogleSignInService(usuarioDao);
  }

  @override
  void dispose() {
    correoController.dispose();
    passwordController.dispose();
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
          child: Column(
            children: [
              // Logo Placeholder
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.bolt, size: 60, color: Colors.amber),
              ),
              const SizedBox(height: 16),
              const Text(
                "Bienvenido a ChallUp",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Mejora cada día",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 40),

              // Login Card
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
                  children: [
                    TextField(
                      controller: correoController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Correo',
                        prefixIcon: const Icon(Icons.email, color: Colors.deepPurple),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: const Icon(Icons.lock, color: Colors.deepPurple),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 20),

                    if (mensaje.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          mensaje,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mensaje.toLowerCase().contains('exitoso')
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                    cargando
                        ? const CircularProgressIndicator(color: Colors.deepPurple)
                        : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: iniciarSesion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text("Iniciar sesión", style: TextStyle(fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Google Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Image.asset('assets/google_logo.png', width: 24),
                  label: const Text("Continuar con Google"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: iniciarConGoogle,
                ),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegisterScreen()),
                  );
                },
                child: const Text(
                  "¿No tienes cuenta? Regístrate",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
