import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileService {
  Future<String> _getDirectoryPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<List<String>> getFiles() async {
    String path = await _getDirectoryPath();
    final dir = Directory(path);
    return dir.listSync().map((file) => file.path.split('/').last).toList();
  }

  Future<void> createFile(String fileName) async {
    String path = await _getDirectoryPath();
    File('$path/$fileName').create();
  }

  Future<void> deleteFile(String fileName) async {
    String path = await _getDirectoryPath();
    File('$path/$fileName').delete();
  }

  Future<void> renameFile(String fileName, String newName) async {}
}