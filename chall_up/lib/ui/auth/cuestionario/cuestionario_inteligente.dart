import 'package:flutter/material.dart';
import 'model/pregunta_model.dart';
import 'data/cuestionario_flujo.dart';

class CuestionarioInteligente extends StatefulWidget {
  @override
  State<CuestionarioInteligente> createState() => _CuestionarioInteligenteState();
}

class _CuestionarioInteligenteState extends State<CuestionarioInteligente> {
  String preguntaActual = "hobbies";

  Map<String, String> respuestas = {};

  void seleccionarOpcion(Opcion opcion, Pregunta pregunta) {
    setState(() {
      respuestas[pregunta.id] = opcion.id;
      preguntaActual = opcion.siguiente ?? obtenerSiguientePregunta(pregunta.id);
    });
  }

  String obtenerSiguientePregunta(String id) {
    final keys = preguntas.keys.toList();
    final index = keys.indexOf(id);
    if (index + 1 < keys.length) return keys[index + 1];
    return "final";
  }

  @override
  Widget build(BuildContext context) {
    if (preguntaActual == "final") {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "¡Gracias por compartir! 💙",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, respuestas);
                },
                child: Text("Continuar"),
              )
            ],
          ),
        ),
      );
    }

    final p = preguntas[preguntaActual]!;

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      body: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              p.titulo,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            ...p.opciones.map((o) => GestureDetector(
              onTap: () => seleccionarOpcion(o, p),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: ListTile(
                  leading: Text(o.emoji, style: TextStyle(fontSize: 32)),
                  title: Text(o.label),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
