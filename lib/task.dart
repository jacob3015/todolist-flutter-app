// Task data model
class Task {

  // Instance variables for task data model
  final String _taskTitle;
  final String _taskDetails;

  // Constructor using string
  Task(this._taskTitle, this._taskDetails);

  // Constructor using json
  Task.fromJson(Map<String, dynamic> json)
      : _taskTitle = json['title'],
        _taskDetails = json['details'];

  // Encode task data model to json
  Map<String, dynamic> toJson() => {
    'title' : _taskTitle,
    'details' : _taskDetails,
  };

  // Getters
  String get getTitle => _taskTitle;
  String get getDetails => _taskDetails;
}