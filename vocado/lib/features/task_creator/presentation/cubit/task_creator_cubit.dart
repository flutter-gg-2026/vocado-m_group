import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/task_creator/domain/use_cases/task_creator_use_case.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';

class TaskCreatorCubit extends Cubit<TaskCreatorState> {
  final TaskCreatorUseCase _taskCreatorUseCase;

  TaskCreatorCubit(this._taskCreatorUseCase) : super(TaskCreatorInitialState());

  Future<void> getTaskCreatorMethod() async {
    final result = await _taskCreatorUseCase.getTaskCreator();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
        //here is when error result
      },
    );
  }

  void getTask({Map<String, dynamic>? json}) {
    if (json == null) {
      emit(const TaskCreatorErrorState(message: "No data received"));
      return;
    }

    if (json["error"] == true) {
      emit(TaskCreatorErrorState(message: json["message"] ?? "AI failed"));
      return;
    }

    final task = json["task"]?.toString().trim() ?? "";
    final assignee = json["assignee"]?.toString().trim() ?? "";

    if (task.isEmpty || assignee.isEmpty) {
      emit(const TaskCreatorErrorState(message: "Invalid task data"));
      return;
    }

    emit(TaskCreatorSuccessState(json: json));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
