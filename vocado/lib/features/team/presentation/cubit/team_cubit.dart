import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/team/domain/use_cases/team_use_case.dart';
import 'package:vocado/features/team/presentation/cubit/team_state.dart';

class TeamCubit extends Cubit<TeamState> {
  final TeamUseCase _teamUseCase;

  TeamCubit(this._teamUseCase) : super(TeamInitialState()) {
    getTeamMethod();
  }

  Future<void> getTeamMethod() async {
    final result = await _teamUseCase.getTeam();
    result.when(
      (success) {
        emit(TeamSuccessState());
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  Future<void> getAddMember() async {
    final result = await _teamUseCase.getAddMember();
    result.when(
      (success) {
        emit(TeamSuccessState());
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
