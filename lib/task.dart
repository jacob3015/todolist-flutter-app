class Task {

  final String _taskTitle;
  final String _taskDetails;

  Task(this._taskTitle, this._taskDetails);

  Task.fromJson(Map<String, dynamic> json)
      : _taskTitle = json['title'],
        _taskDetails = json['details'];

  Map<String, dynamic> toJson() => {
    'title' : _taskTitle,
    'details' : _taskDetails,
  };

  String get getTitle => _taskTitle;
  String get getDetails => _taskDetails;
}