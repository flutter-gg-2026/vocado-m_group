import 'package:equatable/equatable.dart';
import 'package:vocado/features/tasks_board/domain/entities/tasks_board_entity.dart';

abstract class TasksBoardState extends Equatable {
  const TasksBoardState();

  @override
  List<Object?> get props => [];
}

class TasksBoardInitialState extends TasksBoardState {}

class TasksBoardSuccessState extends TasksBoardState {
  final List<TasksBoardEntity> tasks;
  const TasksBoardSuccessState({required this.tasks});

   @override
  List<Object?> get props => [tasks];
}

class TasksBoardErrorState extends TasksBoardState {
  final String message;
  const TasksBoardErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
