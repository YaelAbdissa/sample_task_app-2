class TaskModel {
  final String taskTitle;
  final String dueDate;
  final String type;
  final String priority;
  final String description;
  final bool isChecked;

  TaskModel({
    required this.type,
    required this.priority,
    required this.taskTitle,
    required this.dueDate,
    required this.description,
    required this.isChecked,
  });

  dynamic toJson() {
    return {
      'is_checked': isChecked,
      'description': description,
      'due_date': dueDate,
      'task_title': taskTitle,
      'priority': priority,
      'type': type,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      isChecked: json['is_checked'],
      description: json['description'],
      dueDate: json['due_date'],
      taskTitle: json['task_title'],
      priority: json['priority'],
      type: json['type'],
    );
  }
}
