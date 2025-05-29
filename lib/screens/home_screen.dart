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
      // Aforador Tab centrado en un contenedor con bordes redondeados
      Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          width: 400,
          child: ListView(
            shrinkWrap: true,
            children: [
              _buildLabeledTextField('Modelo'),
              const SizedBox(height: 12),
              _buildLabeledTextField('NSM'),
              const SizedBox(height: 12),
              _buildLabeledTextField('Baudrate'),
              const SizedBox(height: 12),
              _buildLabeledTextField('NSUE'),
              const SizedBox(height: 12),
              _buildLabeledTextField('Diámetro nominal (mm)'),
              const SizedBox(height: 12),
              _buildLabeledDropdown('Sistema', ['Sistema 1', 'Sistema 2']),
            ],
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

// Helper widget for labeled text fields with rounded borders and smaller size
Widget _buildLabeledTextField(String label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      SizedBox(
        height: 36,
        child: TextField(
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
          ),
        ),
      ),
    ],
  );
}

// Helper widget for labeled dropdowns with rounded borders and smaller size
Widget _buildLabeledDropdown(String label, List<String> items) {
  String? selectedValue = items.isNotEmpty ? items.first : null;
  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          SizedBox(
            height: 36,
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
              ),
              items: items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
        ],
      );
    },
  );
}
