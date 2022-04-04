import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:todoapp/task.dart';

// TaskList for treat tasks, It needs to be provider
class TaskList extends ChangeNotifier {

  // List for treat tasks
  final List<Task> _tasks;

  TaskList() : _tasks = [];

  TaskList.fromList(List<Task> tasks) : _tasks = tasks;

  // Constructor using json
  TaskList.fromJson(Map<String, dynamic> json)
      : _tasks = json['tasks'];

  // Encode task list to json
  Map<String, dynamic> toJson() => {
    'tasks' : _tasks
  };

  // Getter
  List<Task> get  getTaskList {
    return _tasks;
  }

  // Add task to the list, needs file handler for write the change of task list
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // Delete task from the list, needs file handler for write the change of task list
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