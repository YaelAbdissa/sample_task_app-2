import 'package:flutter/material.dart';
import 'task_model.dart';
import '../database/task.dart' as taskList;

class TaskProvider with ChangeNotifier {
  List<dynamic> tasks = taskList.tasks;

  List<TaskModel> getAllTasks() {
    final jsonList = tasks;
    return jsonList.map((json) => TaskModel.fromJson(json)).toList();
  }

  void createRecord(TaskModel task) async {
    tasks.add(task.toJson());
    notifyListeners();
  }

  void deleteRecord(int index) async {
    tasks.removeAt(index);
    notifyListeners();
  }

  void updateRecord(int index, TaskModel updatedTask) async {
    tasks[index] = updatedTask.toJson();
    notifyListeners();
  }
}
