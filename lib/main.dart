import 'package:flutter/material.dart';
import 'database/database_helper.dart';

void main() {
  runApp(const ChallUpApp());
}

class ChallUpApp extends StatelessWidget {
  const ChallUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chall Up',
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chall Up - Base Local')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            int id = await dbHelper.insertUsuario('Christian', 'test@challup.com');
            debugPrint('Usuario insertado con ID: $id');
            final usuarios = await dbHelper.getUsuarios();
            debugPrint('Usuarios registrados: $usuarios');
          },
          child: const Text('Insertar usuario de prueba'),
        ),
      ),
    );
  }
}
