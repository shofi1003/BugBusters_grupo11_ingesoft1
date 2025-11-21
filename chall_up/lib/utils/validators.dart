class Validators {
  // Validar correo electrónico
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  // Validar contraseña:
  // - mínimo 8 caracteres
  // - al menos 1 mayúscula
  // - al menos 1 número
  static bool isValidPassword(String password) {
    final regex =
        RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$');
    return regex.hasMatch(password);
  }

  // Validar nombre (solo letras y espacios, mínimo 2 caracteres)
  static bool isValidName(String name) {
    final regex = RegExp(r'^[A-Za-zÁÉÍÓÚáéíóúñÑ ]{2,}$');
    return regex.hasMatch(name.trim());
  }

  // Validador general para campos opcionales
  static bool isNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }
}
