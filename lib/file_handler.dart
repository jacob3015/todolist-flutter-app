import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

// FileHandler for File io, FileHandler only needs when task list have some changes, So it doesn't needs to be provider
class FileHandler {

  // Initialize the file name
  final String _fileName = 'tasks.json';

  // Get local path in app document directory
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  // Get the file
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  // Read the file as string, this function will return json string
  Future<String> readJson() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    }
    catch (e) {
      return 'ERROR FROM FILE HANDLER READ JSON';
    }
  }

  // Write the file with given string
  Future<void> writeJson(String contents) async {
    final file = await _localFile;
    file.writeAsString(contents);
  }
}