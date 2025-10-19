import 'package:flutter/material.dart';

class CuestionarioScreen extends StatelessWidget {
  const CuestionarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cuestionario")),
      body: const Center(child: Text("Pantalla de cuestionario pendiente")),
    );
  }
}
