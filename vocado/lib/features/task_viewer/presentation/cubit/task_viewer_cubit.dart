import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskViewerUseCase _taskViewerUseCase;
  List<TaskViewerEntity> tasks = [];

  TaskViewerCubit(this._taskViewerUseCase) : super(TaskViewerInitialState()){
    getTaskViewerMethod();
  }

  Future<void> getTaskViewerMethod() async {
    emit(TaskViewerLoadingState());
    final result = await _taskViewerUseCase.getTaskViewer();
    
    result.when(
      (success) {
        tasks = success;
        emit(TaskViewerSuccessState(tasks: tasks));
      },
      (whenError) {
        emit(TaskViewerErrorState(message: whenError.message));
      },
    );
  }

  Future<void> changeTaskStatusMethod({required String taskId ,required String newStatus}) async {
    emit(TaskViewerLoadingState());
    final result = await _taskViewerUseCase.changeTaskStatus(taskId: taskId, newStatus: newStatus);
    final newList = await _taskViewerUseCase.getTaskViewer();
    newList.when(
      (success) {
        tasks = success;
      },
      (whenError) {
        emit(TaskViewerErrorState(message: whenError.message));
      },
    );
    result.when(
      (success) {
        emit(TaskViewerSuccessState(tasks: tasks));
      },
      (whenError) {
        emit(TaskViewerErrorState(message: whenError.message));
      },
    );
  }

  Future<void> getSignOutMethod() async {
    final result = await _taskViewerUseCase.getSignOut();
    result.when(
      (success) {
        emit(SignOutSuccessState());
      },
      (whenError) {
        emit(TaskViewerErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
