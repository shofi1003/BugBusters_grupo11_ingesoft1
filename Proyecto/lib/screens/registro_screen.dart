import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  _RegistroScreenState createState() => _RegistroScreenState();
}

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  String rolSeleccionado = 'Usuario';
  final db = DatabaseHelper.instance;

  void registrarUsuario() async {
    final nombre = nombreController.text.trim();
    final correo = correoController.text.trim();
    final contrasena = contrasenaController.text.trim();

    if (nombre.isEmpty || correo.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Completa todos los campos")),
      );
      return;
    }

    try {

      final bytes = utf8.encode(contrasena);
      final hashedPassword = sha256.convert(bytes).toString();

      final idUsuario = await db.insertarUsuario({
        'nombre': nombre,
        'correo': correo,
        'telefono': '',
        'contrasena': hashedPassword,
        'google_id': null,
      });


      final dbConn = await db.database;
      final rol = await dbConn.query('Rol', where: 'nombre = ?', whereArgs: [rolSeleccionado]);
      if (rol.isNotEmpty) {
        await dbConn.insert('UsuarioRol', {
          'usuario_id': idUsuario,
          'rol_id': rol.first['id'],
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuario '$nombre' registrado como $rolSeleccionado")),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al registrar usuario: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registro de Usuario")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: correoController,
              decoration: const InputDecoration(labelText: "Correo"),
            ),
            TextField(
              controller: contrasenaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Contraseña"),
            ),
            const SizedBox(height: 15),
            DropdownButton<String>(
              value: rolSeleccionado,
              items: const [
                DropdownMenuItem(value: 'Usuario', child: Text('Usuario')),
                DropdownMenuItem(value: 'Moderador', child: Text('Moderador')),
              ],
              onChanged: (value) => setState(() => rolSeleccionado = value!),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: registrarUsuario,
              child: const Text("Registrar"),
            ),
          ],
        ),
      ),
    );
  }
}
