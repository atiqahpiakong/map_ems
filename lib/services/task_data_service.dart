import 'package:firebase_auth/firebase_auth.dart';

import './rest_service.dart';
import '../model/task_model.dart';

class TaskDataService {
  static final TaskDataService _instance = TaskDataService._constructor();
  factory TaskDataService() {
    return _instance;
  }

  TaskDataService._constructor();
  final rest = RestService();

  Future<List<Task>> getAllTask() async {
    final listJson = await rest.get('task');

    return (listJson as List)
        .map((itemJson) => Task.fromJson(itemJson))
        .toList();
  }

  Future<List<Task>> getMyTask() async {
    String uid = (await FirebaseAuth.instance.currentUser()).uid;

    final listJson = await rest.get('task/$uid/mytask');
    return (listJson as List)
        .map((itemJson) => Task.fromJson(itemJson))
        .toList();
  }

  Future<Task> deleteTask({String id}) async {
    final json = await rest.delete('task/$id');
    return Task.fromJson(json);
  }

  Future<Task> createTask({Task task}) async {
    final json = await rest.post('task', data: task);
    return Task.fromJson(json);
  }

  Future<Task> updateTask({String id, String status}) async {
    final json = await rest.patch('task/$id', data: {'status': status});
    return Task.fromJson(json);
  }
} // class Task
