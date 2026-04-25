import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/task_creator/data/models/task_creator_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskCreatorRemoteDataSource {
  Future<TaskCreatorModel> getTaskCreator();
  Future<bool> signOut();
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
  Future<bool> signOut() async {
    try {
      await _supabase.auth.signOut();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
