import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/tasks_board/domain/entities/tasks_board_entity.dart';

import 'package:vocado/features/tasks_board/data/datasources/tasks_board_remote_data_source.dart';
import 'package:vocado/features/tasks_board/data/models/tasks_board_model.dart';
import 'package:vocado/features/tasks_board/domain/repositories/tasks_board_repository_domain.dart';

@LazySingleton(as: TasksBoardRepositoryDomain)
class TasksBoardRepositoryData implements TasksBoardRepositoryDomain {
  final BaseTasksBoardRemoteDataSource remoteDataSource;

  TasksBoardRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<TasksBoardEntity>, Failure>> getTasksBoard({
    required int index,
  }) async {
    try {
      final response = await remoteDataSource.getTasksBoard(index: index);
      return Success(response.map((item) => item.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
