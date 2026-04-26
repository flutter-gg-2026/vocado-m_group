import 'package:equatable/equatable.dart';

class TasksBoardEntity extends Equatable {
  final String task;
  final String dueDate;
  final String status;

  const TasksBoardEntity({required this.task, required this.dueDate, required this.status});

  @override
  List<Object?> get props => [task, dueDate,status];
}
