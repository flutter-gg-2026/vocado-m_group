import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskViewerUseCase _taskViewerUseCase;

  TaskViewerCubit(this._taskViewerUseCase) : super(TaskViewerInitialState());

  Future<void> getTaskViewerMethod() async {
    final result = await _taskViewerUseCase.getTaskViewer();
    result.when(
      (success) {
        print("Success State");
        emit(TaskViewerSuccessState(tasks: success));
      },
      (whenError) {
        print("Error State");
        emit(TaskViewerErrorState(message: whenError.message));
      },
    );
  }

  Future<void> changeTaskStatusMethod({required String taskId ,required String newStatus}) async {
    final result = await _taskViewerUseCase.changeTaskStatus(taskId: taskId, newStatus: newStatus);
    result.when(
      (success) {
        print("Updated State");
        emit(TaskViewerUpdateTaskState());
      },
      (whenError) {
        print("Error State");
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
