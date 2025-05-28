import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/login_header.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/login_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginHeader(),
              const SizedBox(height: 30),
              SizedBox(width: 300, child: const CustomTextField(hintText: 'Correo electrónico')),
              const SizedBox(height: 15),
              SizedBox(width: 300, child: const CustomTextField(hintText: 'Contraseña', isPassword: true)),
              const SizedBox(height: 30),
              SizedBox(width: 200, child: LoginButton(onPressed: () {})),
              const SizedBox(height: 20),

              // Botón para cambiar el tema
              IconButton(
                icon: Icon(themeProvider.themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}