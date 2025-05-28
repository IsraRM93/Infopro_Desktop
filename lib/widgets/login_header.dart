import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.lock, size: 80, color: Colors.blue),
        const SizedBox(height: 10),
        Text(
          'Iniciar Sesión',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}