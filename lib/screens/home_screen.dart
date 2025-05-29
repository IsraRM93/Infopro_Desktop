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

    final List<Widget> tabViews = [
      // Aforador tab content with TextFields
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            ListTile(
              title: Text('Modelo'),
              subtitle: TextField(
                decoration: InputDecoration(hintText: 'Ingrese Modelo'),
              ),
            ),
            ListTile(
              title: Text('NSM'),
              subtitle: TextField(
                decoration: InputDecoration(hintText: 'Ingrese NSM'),
              ),
            ),
            ListTile(
              title: Text('Baud Rate'),
              subtitle: TextField(
                decoration: InputDecoration(hintText: 'Ingrese Baud Rate'),
              ),
            ),
            ListTile(
              title: Text('NSUE'),
              subtitle: TextField(
                decoration: InputDecoration(hintText: 'Ingrese NSUE'),
              ),
            ),
            ListTile(
              title: Text('Diemetro Nominal (mm)'),
              subtitle: TextField(
                decoration: InputDecoration(
                  hintText: 'Ingrese Diemetro Nominal (mm)',
                ),
              ),
            ),
            ListTile(
              title: Text('Sistema'),
              subtitle: TextField(
                decoration: InputDecoration(hintText: 'Ingrese Sistema'),
              ),
            ),
          ],
        ),
      ),
      // Other tabs remain the same
      const Center(child: Text('Contenido de UVA')),
      const Center(child: Text('Contenido de FTP')),
      const Center(child: Text('Contenido de Concesión')),
      const Center(child: Text('Contenido de Evaluación de conformidad')),
      const Center(child: Text('Contenido de Tiempo')),
      const Center(child: Text('Contenido de Explorador')),
      const Center(child: Text('Contenido de Red')),
      const Center(child: Text('Contenido de Consola')),
      const Center(child: Text('Contenido de Ethernet')),
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
