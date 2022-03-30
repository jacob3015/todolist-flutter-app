import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:todoapp/task.dart';

class TaskList extends ChangeNotifier {

  List<Task> _tasks;

  TaskList()
      : _tasks = [];

  TaskList.fromJson(Map<String, dynamic> json)
      : _tasks = json['tasks'];

  Map<String, dynamic> toJson() => {
    'tasks' : _tasks
  };

  set setTaskList(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  List<Task> get  getTaskList {
    return _tasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    try {
      _tasks.remove(task);
      notifyListeners();
    }
    catch(e) {
      log('ERROR NO SUCH TASK EXIST');
    }
  }
}