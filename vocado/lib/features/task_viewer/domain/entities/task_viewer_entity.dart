import 'package:equatable/equatable.dart';

class TaskViewerEntity extends Equatable {
  final String id;
  final String userId;
  final String task;
  final String status;
  final String dueDate;

  const TaskViewerEntity({
    required this.id,
    required this.userId,
    required this.task,
    required this.status, required this.dueDate,
  });

  @override
  List<Object?> get props => [task, userId, id, status, dueDate];
}
