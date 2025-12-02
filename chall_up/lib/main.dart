import 'package:chall_up/ui/cuestionario/cuestionario_inicial_page.dart';
import 'package:flutter/material.dart';
import 'data/database.dart';
import 'data/seed/seed_retos.dart';
import 'ui/auth/login_screen.dart';
import 'ui/auth/register_screen.dart';

Future<void> main() async {
 // WidgetsFlutterBinding.ensureInitialized();
  //final db = AppDatabase();
  //final seed = RetoSeeder(db);
  //await seed.poblarRetos();
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
