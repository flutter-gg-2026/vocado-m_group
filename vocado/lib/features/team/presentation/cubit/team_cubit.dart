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
        emit(TeamSuccessState(team: success));
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  Future<void> getAllMember() async {
    final result = await _teamUseCase.getAllMember();
    result.when(
      (success) {
        emit(LoadingSuccessState());
        emit(MemberSuccessState(members: success));
      },
      (whenError) {
        emit(TeamErrorState(message: whenError.message));
      },
    );
  }

  Future<void> addMember({
    required String id,
    required String name,
    required String role,
  }) async {
    final result = await _teamUseCase.addMember(id: id, name: name, role: role);
    result.when(
      (success) {
        emit(AddMemberSuccessState());
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
