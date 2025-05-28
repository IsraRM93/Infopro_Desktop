import 'package:flutter/material.dart';
import '../widgets/login_header.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LoginHeader(),
            const SizedBox(height: 20),
            const CustomTextField(hintText: 'Correo electrónico'),
            const SizedBox(height: 10),
            const CustomTextField(hintText: 'Contraseña', isPassword: true),
            const SizedBox(height: 20),
            LoginButton(onPressed: () {
              // Lógica de autenticación aquí
            }),
          ],
        ),
      ),
    );
  }
}