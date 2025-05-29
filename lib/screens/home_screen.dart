import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final List<Tab> tabs = const [
      Tab(text: 'Aforador'),
      Tab(text: 'UVA'),
      Tab(text: 'FTP'),
      Tab(text: 'Concesión'),
      Tab(text: 'Evaluación de conformidad'),
      Tab(text: 'Tiempo'),
      Tab(text: 'Explorador'),
      Tab(text: 'Red'),
      Tab(text: 'Consola'),
      Tab(text: 'Ethernet'),
    ];

    final List<Widget> tabViews = const [
      Center(child: Text('Contenido de Aforador')),
      Center(child: Text('Contenido de UVA')),
      Center(child: Text('Contenido de FTP')),
      Center(child: Text('Contenido de Concesión')),
      Center(child: Text('Contenido de Evaluación de conformidad')),
      Center(child: Text('Contenido de Tiempo')),
      Center(child: Text('Contenido de Explorador')),
      Center(child: Text('Contenido de Red')),
      Center(child: Text('Contenido de Consola')),
      Center(child: Text('Contenido de Ethernet')),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bienvenido"),
          actions: [
            IconButton(
              icon: Icon(
                themeProvider.themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(children: tabViews),
      ),
    );
  }
}
