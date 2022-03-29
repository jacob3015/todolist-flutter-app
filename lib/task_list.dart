import 'package:flutter/foundation.dart';
import 'package:todoapp/local_storage_file_handler.dart';
import 'package:todoapp/task_data_model.dart';

class TaskList extends ChangeNotifier {

  final List<Task> _taskList;


  // needs to re-write the code for read and write with path_provider package
  // under code is just for read the json file and initialize the task list
  TaskList.fromJson(Map<String, dynamic> _data)
    : _taskList = _data['tasks'];

  void addTask(Task _task) {
    _taskList.add(_task);
    notifyListeners();
  }

  void deleteTask(Task _task) {
    if (_taskList.contains(_task)) {
      _taskList.remove(_task);
    }
    notifyListeners();
  }
}