// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_board_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TasksBoardModel _$TasksBoardModelFromJson(Map<String, dynamic> json) =>
    _TasksBoardModel(
      task: json['task'] as String,
      due_date: json['due_date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$TasksBoardModelToJson(_TasksBoardModel instance) =>
    <String, dynamic>{
      'task': instance.task,
      'due_date': instance.due_date,
      'status': instance.status,
    };
