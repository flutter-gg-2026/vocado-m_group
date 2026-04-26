import 'package:vocado/core/extensions/string_extensions.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_viewer_model.freezed.dart';
part 'task_viewer_model.g.dart';

@freezed
abstract class TaskViewerModel with _$TaskViewerModel {
  const factory TaskViewerModel({
    required String id,
    @JsonKey(name: "user_id")
    required String userId,
    required String task,
    required String status,
    @JsonKey(name: "due_date")
    required String dueDate,
    
  }) = _TaskViewerModel;

  factory TaskViewerModel.fromJson(Map<String, Object?> json) => _$TaskViewerModelFromJson(json);
}



extension TaskViewerModelMapper on TaskViewerModel {
  TaskViewerEntity toEntity() {
    return TaskViewerEntity(id: id, userId: userId, task: task, status: status, dueDate: dueDate);
  }
  }
