import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/daos/reto_dao.dart';
import '../../data/database.dart';
import '../../data/daos/evidencia_dao.dart';

class SubirEvidenciaPage extends StatefulWidget {
  final int usuarioId;
  final RetoDiarioConDetalle reto;

  const SubirEvidenciaPage({
    super.key,
    required this.usuarioId,
    required this.reto,
  });

  @override
  State<SubirEvidenciaPage> createState() => _SubirEvidenciaPageState();
}

class _SubirEvidenciaPageState extends State<SubirEvidenciaPage>
    with SingleTickerProviderStateMixin {
  File? imagenSeleccionada;
  final picker = ImagePicker();
  final textoController = TextEditingController();
  bool checkValue = false;

  late AnimationController _animController;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
  }

  @override
  void dispose() {
    textoController.dispose();
    _animController.dispose();
    super.dispose();
  }

  Future<void> seleccionarImagenGaleria() async {
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;

    setState(() => imagenSeleccionada = File(file.path));
  }

  Future<void> seleccionarImagenCamara() async {
    final file = await picker.pickImage(source: ImageSource.camera);
    if (file == null) return;

    setState(() => imagenSeleccionada = File(file.path));
  }

  Future<void> guardarEvidencia() async {
    final hasFoto = imagenSeleccionada != null;
    final hasTexto = textoController.text.trim().isNotEmpty;
    final hasCheck = checkValue;

    if (!hasFoto && !hasTexto && !hasCheck) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecciona al menos un tipo de evidencia (foto, texto o check)") ),
      );
      return;
    }

    final evidenciaDao = EvidenciaDao(AppDatabase());
    final retoDao = RetoDao(AppDatabase());

    String tipo;
    if (hasFoto) {
      tipo = 'foto';
    } else if (hasTexto) {
      tipo = 'texto';
    } else {
      tipo = 'check';
    }

    // 1️⃣ Guardar la evidencia
    await evidenciaDao.guardarEvidencia(
      usuarioId: widget.usuarioId,
      retoDiarioId: widget.reto.retoDiario.id,
      tipoEvidencia: tipo,
      imagenPath: hasFoto ? imagenSeleccionada!.path : null,
      contenidoTexto: hasTexto ? textoController.text.trim() : null,
    );

    // 2️⃣ Marcar reto como COMPLETADO
    await retoDao.marcarRetoComoCompletado(widget.reto.retoDiario.id);

    // 3️⃣ Mensaje con puntos
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("¡Evidencia guardada ($tipo)! Reto completado +${tipo == 'foto' ? 10 : tipo == 'texto' ? 7 : 5} puntos 🎯🔥"),
      ),
    );

    // 4️⃣ Volver
    Navigator.pop(context);
    Navigator.pop(context);
  }

  // ============ ELIMINA ESTAS LÍNEAS 108-109 ============
  // }
  // 
  // 
  // ======================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurple.shade800,
              Colors.deepPurple.shade600,
              Colors.deepPurple.shade300,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: CurvedAnimation(
              parent: _animController,
              curve: Curves.easeIn,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // HEADER
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "Subir evidencia",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.camera_alt, color: Colors.white),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // CARD DEL RETO
                  _buildRetoCard(),

                  const SizedBox(height: 20),

                  // PREVIEW DE IMAGEN
                  _buildPreviewImagen(),

                  const SizedBox(height: 20),

                  // BOTONES DE ACCIÓN
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: seleccionarImagenGaleria,
                          icon: const Icon(Icons.photo_library),
                          label: const Text("Galería"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: seleccionarImagenCamara,
                          icon: const Icon(Icons.photo_camera),
                          label: const Text("Cámara"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple.shade50,
                            foregroundColor: Colors.deepPurple.shade700,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // BOTÓN GUARDAR
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: guardarEvidencia,
                      icon: const Icon(Icons.check_circle),
                      label: const Text(
                        "Guardar evidencia",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ----------------- WIDGETS AUXILIARES ----------------------

  Widget _buildRetoCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Estás completando:",
            style: TextStyle(
              fontSize: 14,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.reto.retoBase.descripcion ?? "Reto del día",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewImagen() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: imagenSeleccionada == null
            ? Colors.white.withOpacity(0.2)
            : Colors.transparent,
        border: Border.all(
          color: Colors.white.withOpacity(0.4),
        ),
      ),
      child: imagenSeleccionada == null
          ? Center(
        child: Icon(
          Icons.image,
          color: Colors.white.withOpacity(0.8),
          size: 80,
        ),
      )
          : ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.file(
          imagenSeleccionada!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}