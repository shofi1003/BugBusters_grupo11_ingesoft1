import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  final db = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Panel de Moderador')),
      body: FutureBuilder(
        future: db.database,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return const Center(
            child: Text("Aquí se mostrará la información de la base de datos."),
          );
        },
      ),
    );
  }
}
