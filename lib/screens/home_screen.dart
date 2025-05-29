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

    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.grey),
    );

    final List<Widget> tabViews = [
      // Aforador tab content centered and inside a rounded Card, Card adapts to content
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: const BorderSide(color: Colors.grey, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 40),
              child: IntrinsicWidth(
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 120, child: Text('Modelo')),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 180,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ingrese Modelo',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                border: border,
                                enabledBorder: border,
                                focusedBorder: border,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 120, child: Text('NSM')),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 180,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ingrese NSM',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                border: border,
                                enabledBorder: border,
                                focusedBorder: border,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 120, child: Text('Baud Rate')),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 180,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ingrese Baud Rate',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                border: border,
                                enabledBorder: border,
                                focusedBorder: border,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 120, child: Text('NSUE')),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 180,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ingrese NSUE',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                border: border,
                                enabledBorder: border,
                                focusedBorder: border,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 120,
                            child: Text('Diemetro Nominal (mm)'),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 180,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ingrese Diemetro Nominal (mm)',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                border: border,
                                enabledBorder: border,
                                focusedBorder: border,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 120, child: Text('Sistema')),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 180,
                            height: 36,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Ingrese Sistema',
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                border: border,
                                enabledBorder: border,
                                focusedBorder: border,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
