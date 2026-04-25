import 'package:equatable/equatable.dart';

abstract class TaskCreatorState extends Equatable {
  const TaskCreatorState();

  @override
  List<Object?> get props => [];
}

class TaskCreatorInitialState extends TaskCreatorState {}

class TaskCreatorSuccessState extends TaskCreatorState {
  final Map<String, dynamic> json;

  const TaskCreatorSuccessState({required this.json});
  @override
  List<Object?> get props => [json];
}

class TaskCreatorErrorState extends TaskCreatorState {
  final String message;
  const TaskCreatorErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
