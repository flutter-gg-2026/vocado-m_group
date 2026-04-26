// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskViewerModel _$TaskViewerModelFromJson(Map<String, dynamic> json) =>
    _TaskViewerModel(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      task: json['task'] as String,
      status: json['status'] as String,
      dueDate: json['due_date'] as String,
    );

Map<String, dynamic> _$TaskViewerModelToJson(_TaskViewerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'task': instance.task,
      'status': instance.status,
      'due_date': instance.dueDate,
    };
