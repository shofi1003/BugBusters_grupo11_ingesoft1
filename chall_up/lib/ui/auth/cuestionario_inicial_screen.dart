import 'package:flutter/material.dart';

class CuestionarioInicialScreen extends StatelessWidget {
  const CuestionarioInicialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuestionario Inicial"),
      ),
      body: const Center(
        child: Text(
          "Aquí va el cuestionario inicial",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
