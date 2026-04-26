import 'package:vocado/features/tasks_board/domain/entities/tasks_board_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_board_model.freezed.dart';
part 'tasks_board_model.g.dart';

@freezed
abstract class TasksBoardModel with _$TasksBoardModel {
  const factory TasksBoardModel({
    required String task,
    required String due_date,
    required String status,
  }) = _TasksBoardModel;

  factory TasksBoardModel.fromJson(Map<String, Object?> json) =>
      _$TasksBoardModelFromJson(json);
}

extension TasksBoardModelMapper on TasksBoardModel {
  TasksBoardEntity toEntity() {
    return TasksBoardEntity(dueDate: due_date, task: task,status: status);
  }
}
