import 'package:chall_up/ui/cuestionario/cuestionario_inicial_page.dart';
import 'package:flutter/material.dart';
import 'services/notification_service.dart';
import 'data/database.dart';
import 'data/seed/seed_retos.dart';
import 'ui/auth/login_screen.dart';
import 'ui/auth/register_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final notificationService = NotificationService();
  await notificationService.initialize();
  await notificationService.requestPermissions();

  runApp(const ChallUpApp());
}

class ChallUpApp extends StatelessWidget {
  const ChallUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChallUp',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        "/cuestionario": (context) => CuestionarioInicialPage(usuarioId: 1),
      },
    );
  }
}
