import 'package:flutter/material.dart';
import '../services/file_service.dart';
import 'file_actions.dart';

class FileItem extends StatelessWidget {
  final String fileName;
  final FileService fileService;
  final VoidCallback onFileUpdated;

  const FileItem({super.key, required this.fileName, required this.fileService, required this.onFileUpdated});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(fileName),
      trailing: FileActions(fileName: fileName, fileService: fileService, onFileUpdated: onFileUpdated),
    );
  }
}