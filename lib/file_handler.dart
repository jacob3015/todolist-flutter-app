import 'dart:io';

import 'package:path_provider/path_provider.dart';


class FileHandler {

  final String _fileName = 'tasks.json';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<String> readJson() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    }
    catch(e) {
      return 'ERROR : FILE HANDLER READ JSON THROWS EXCEPTION';
    }
  }

  Future<void> writeJson(String contents) async {
    final file = await _localFile;
    file.writeAsString(contents);
  }
}