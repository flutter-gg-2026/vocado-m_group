import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/task_creator/data/models/task_creator_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskCreatorRemoteDataSource {
  Future<TaskCreatorModel> getTaskCreator();
  Future<bool> addTask({required Map<String, dynamic> json});
}

@LazySingleton(as: BaseTaskCreatorRemoteDataSource)
class TaskCreatorRemoteDataSource implements BaseTaskCreatorRemoteDataSource {
  final SupabaseClient _supabase;

  TaskCreatorRemoteDataSource(this._supabase);

  @override
  Future<TaskCreatorModel> getTaskCreator() async {
    try {
      return TaskCreatorModel(
        id: 1,
        firstName: "Last Name",
        lastName: "First Name",
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> addTask({required Map<String, dynamic> json}) async {
    try {
      final user = await _supabase
          .from('users')
          .select('id, name')
          .ilike('name', '%${json["assignee"]}%')
          .maybeSingle();

      if (user != null) {
        await _supabase.from("tasks").insert({
          "user_id": user['id'],
          "task": json['task'],
          "status": "Pending",
          "due_date": json['due_date'],
        });
        return true;
      }
      print(user.toString());
      return false;
    } catch (error) {
      print(error);
      throw FailureExceptions.getException(error);
    }
  }
}
