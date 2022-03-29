import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:todoapp/task_list.dart';

class LocalStorageFileHandler {

  final String _path = 'assets';
  final String _fileName = 'task_list_file.json';

  // needs to re-write the code with read and write file with path_provider package
  // under code is just for reading the file

  Future<Map<String, dynamic>> readJson() async {
    final String _response =  await rootBundle.loadString('$_path/$_fileName');
    return await jsonDecode(_response);
  }

  Future<void> writeJson(TaskList _taskList) async {
    String _json = jsonEncode(_taskList);
  }
}