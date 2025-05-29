import 'package:flutter/material.dart';
import '../services/file_service.dart';

class FileActions extends StatelessWidget {
  final String fileName;
  final FileService fileService;
  final VoidCallback onFileUpdated;

  const FileActions({super.key, required this.fileName, required this.fileService, required this.onFileUpdated});

  void _renameFile(BuildContext context) async {
    TextEditingController controller = TextEditingController(text: fileName);
    
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Renombrar Archivo"),
          content: TextField(controller: controller),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () async {
                await fileService.renameFile(fileName, controller.text);
                onFileUpdated();
                Navigator.pop(context);
              },
              child: const Text("Guardar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == "Eliminar") {
          fileService.deleteFile(fileName).then((_) => onFileUpdated());
        } else if (value == "Renombrar") {
          _renameFile(context);
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: "Renombrar", child: Text("Renombrar")),
        const PopupMenuItem(value: "Eliminar", child: Text("Eliminar")),
      ],
    );
  }
}