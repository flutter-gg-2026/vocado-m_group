import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/tasks_board/data/models/tasks_board_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTasksBoardRemoteDataSource {
  Future<List<TasksBoardModel>> getTasksBoard({required int index});
}

@LazySingleton(as: BaseTasksBoardRemoteDataSource)
class TasksBoardRemoteDataSource implements BaseTasksBoardRemoteDataSource {
  final SupabaseClient _supabase;
  

  TasksBoardRemoteDataSource(this._supabase);
  @override
  Future<List<TasksBoardModel>> getTasksBoard({required int index}) async {
    try {
      String status;

      if (index == 0) {
        status = 'In Progress';
      } else if (index == 1) {
        status = 'Done';
      } else {
        status = 'Pending';
      }

      final query = await _supabase
          .from('tasks')
          .select("task , due_date,status")
          .eq('status', status);

      print(query.toString());
      return query.map((item) => TasksBoardModel.fromJson(item)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
