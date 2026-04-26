// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_viewer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskViewerModel _$TaskViewerModelFromJson(Map<String, dynamic> json) =>
    _TaskViewerModel(
      id: json['id'] as String,
      userId: json['userId'] as String? ?? 'user_id',
      task: json['task'] as String,
      status: json['status'] as String,
      dueDate: json['dueDate'] as String? ?? 'due_date',
    );

Map<String, dynamic> _$TaskViewerModelToJson(_TaskViewerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'task': instance.task,
      'status': instance.status,
      'dueDate': instance.dueDate,
    };
