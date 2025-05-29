// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = Theme.of(context).cardColor;
    final borderColor = isDark ? Colors.grey.shade700 : Colors.grey.shade400;
    final fieldFillColor = isDark ? Colors.grey.shade900 : Colors.grey.shade100;

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
            color: cardColor,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          width: 500,
          child: ListView(
            shrinkWrap: true,
            children: [
              // Fila con los campos y combos uno al lado del otro
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Modelo',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledTextField(
                      'NSM',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Baudrate',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledTextField(
                      'NSUE',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Diámetro nominal (mm)',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledDropdown(
                      'Sistema',
                      ['Medidor (M)', 'Sistema de medicion (SM)'],
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Medición actual (RS485)
              _buildCurrentMeasurementSection(
                borderColor,
                fieldFillColor,
                isDark,
              ),
            ],
          ),
        ),
      ),
      // UVA Tab con ID, Usuario y Contraseña, mismo estilo que Aforador
      Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          width: 500,
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'ID',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledTextField(
                      'Usuario',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Contraseña',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: SizedBox(),
                  ), // Espacio vacío para alinear
                ],
              ),
            ],
          ),
        ),
      ),
      // FTP Tab: Servidor Principal y Envío
      Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          width: 500,
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Servidor Principal',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Servidor',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledTextField(
                      'Folder',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Puerto',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledTextField(
                      'Usuario',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Contraseña',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(child: SizedBox()),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Envío',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 18),
              const SizedBox(width: 12),
              Expanded(
                child: _buildLabeledTextField(
                  'Hora',
                  borderColor,
                  fieldFillColor,
                  isDark,
                ),
              ),
            ],
          ),
        ),
      ),

      // Concesión Tab: RFC, Etiqueta, Latitud, Longitud y Fecha
      Center(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                color: isDark
                    ? Colors.black.withOpacity(0.2)
                    : Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          width: 500,
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'RFC',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledTextField(
                      'Etiqueta',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Latitud',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildLabeledTextField(
                      'Longitud',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      'Fecha',
                      borderColor,
                      fieldFillColor,
                      isDark,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ],
          ),
        ),
      ),
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
Widget _buildLabeledTextField(
  String label,
  Color borderColor,
  Color fillColor,
  bool isDark,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      const SizedBox(height: 6),
      SizedBox(
        height: 36,
        child: TextField(
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.white : Colors.black,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: borderColor, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            filled: true,
            fillColor: fillColor,
          ),
        ),
      ),
    ],
  );
}

// Helper widget for labeled dropdowns with rounded borders and smaller size
Widget _buildLabeledDropdown(
  String label,
  List<String> items,
  Color borderColor,
  Color fillColor,
  bool isDark,
) {
  String? selectedValue = items.isNotEmpty ? items.first : null;
  return StatefulBuilder(
    builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            height: 36,
            child: DropdownButtonFormField<String>(
              value: selectedValue,
              style: TextStyle(
                fontSize: 14,
                color: isDark ? Colors.white : Colors.black,
              ),
              dropdownColor: fillColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: borderColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide(color: borderColor, width: 2),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                filled: true,
                fillColor: fillColor,
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  )
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

// Widget para mostrar la medición actual recibida por RS485
Widget _buildCurrentMeasurementSection(
  Color borderColor,
  Color fillColor,
  bool isDark,
) {
  // Aquí puedes conectar con el backend o el puerto RS485 real.
  // Por ahora, mostramos un valor simulado.
  String simulatedValue = "123.45 m³/h";

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Medición actual (RS485)',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      const SizedBox(height: 6),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(16.0),
          color: fillColor,
        ),
        child: Text(
          simulatedValue,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
    ],
  );
}
