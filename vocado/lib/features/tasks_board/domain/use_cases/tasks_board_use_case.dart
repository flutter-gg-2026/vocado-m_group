import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/tasks_board/domain/entities/tasks_board_entity.dart';
import 'package:vocado/features/tasks_board/domain/repositories/tasks_board_repository_domain.dart';


@lazySingleton
class TasksBoardUseCase {
  final TasksBoardRepositoryDomain _repositoryData;

  TasksBoardUseCase(this._repositoryData);

   Future<Result<TasksBoardEntity, Failure>> getTasksBoard() async {
    return _repositoryData.getTasksBoard();
  }
}
