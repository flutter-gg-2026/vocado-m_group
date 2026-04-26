import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/tasks_board/domain/use_cases/tasks_board_use_case.dart';
import 'package:vocado/features/tasks_board/presentation/cubit/tasks_board_state.dart';

class TasksBoardCubit extends Cubit<TasksBoardState> {
  final TasksBoardUseCase _tasksBoardUseCase;

  TasksBoardCubit(this._tasksBoardUseCase) : super(TasksBoardInitialState()) {
    getTasksBoardMethod(index: 1);
  }

  Future<void> getTasksBoardMethod({required int index}) async {
    final result = await _tasksBoardUseCase.getTasksBoard(index: index);
    result.when(
      (success) {
        emit(TasksBoardSuccessState(tasks: success));
      },
      (whenError) {
        emit(TasksBoardErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
