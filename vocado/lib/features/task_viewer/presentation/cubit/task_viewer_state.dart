import 'package:equatable/equatable.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_viewer_entity.dart';

abstract class TaskViewerState extends Equatable {
  const TaskViewerState();

  @override
  List<Object?> get props => [];
}

class TaskViewerInitialState extends TaskViewerState {}
class TaskViewerSuccessState extends TaskViewerState {
  final List<TaskViewerEntity> tasks;

  const TaskViewerSuccessState({required this.tasks});
}
class SignOutSuccessState extends TaskViewerState {}

class TaskViewerErrorState extends TaskViewerState {
  final String message;
  const TaskViewerErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

