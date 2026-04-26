import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/user_service.dart';
import 'package:vocado/features/task_viewer/data/models/task_viewer_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskViewerRemoteDataSource {
  Future<List<TaskViewerModel>> getTaskViewer();
  Future<bool> getSignOut();
  Future<bool> changeTaskStatus({
    required String taskId,
    required String newStatus,
  });
}

@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  TaskViewerRemoteDataSource(this._supabase, this._userService);

  @override
  Future<List<TaskViewerModel>> getTaskViewer() async {
    try {
      final userTasks = await _supabase
          .from('tasks')
          .select()
          .eq("user_id", '${_userService.getUser.id}');

      final tasks = userTasks
          .map((item) => TaskViewerModel.fromJson(item))
          .toList();
      print(tasks);

      return tasks;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> getSignOut() async {
    try {
      await _supabase.auth.signOut();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<bool> changeTaskStatus({
    required String taskId,
    required String newStatus,
  }) async {
    try {
      await _supabase.from('tasks')
          .update({"status":newStatus})
          .eq("id", taskId);
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
