// Task data model
class Task {

  // Instance variables for task data model
  final String _taskTitle;
  final String _taskDetails;

  // Constructor using string
  Task(this._taskTitle, this._taskDetails);

  // Getters
  String get getTitle => _taskTitle;
  String get getDetails => _taskDetails;
}