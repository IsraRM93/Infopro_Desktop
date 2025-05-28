import 'package:flutter/material.dart';
import '../screens/home_screen.dart'; // Importa la pantalla de destino

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          // Aquí puedes agregar lógica de autenticación real si lo necesitas

          // Navegar a la nueva pantalla tras el login exitoso
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: const Text('Ingresar'),
      ),
    );
  }
}
