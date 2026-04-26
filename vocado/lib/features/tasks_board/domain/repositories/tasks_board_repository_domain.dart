import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/tasks_board/domain/entities/tasks_board_entity.dart';

abstract class TasksBoardRepositoryDomain {
    Future<Result<List<TasksBoardEntity>, Failure>> getTasksBoard({required int index});
}
