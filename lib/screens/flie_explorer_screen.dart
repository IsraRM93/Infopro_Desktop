import 'package:flutter/material.dart';
import '../services/file_service.dart';
import '../widgets/file_item.dart';

class FileExplorerScreen extends StatefulWidget {
  const FileExplorerScreen({super.key});

  @override
  _FileExplorerScreenState createState() => _FileExplorerScreenState();
}

class _FileExplorerScreenState extends State<FileExplorerScreen> {
  final FileService fileService = FileService();
  List<String> files = [];

  @override
  void initState() {
    super.initState();
    _loadFiles();
  }

  void _loadFiles() async {
    List<String> loadedFiles = await fileService.getFiles();
    setState(() {
      files = loadedFiles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explorador de Archivos")),
      body: ListView.builder(
        itemCount: files.length,
        itemBuilder: (context, index) {
          return FileItem(
            fileName: files[index],
            fileService: fileService,
            onFileUpdated: _loadFiles,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await fileService.createFile("nuevo_archivo.txt");
          _loadFiles();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}