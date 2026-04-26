import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:vocado/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;

  ProfileCubit(this._profileUseCase) : super(ProfileInitialState()) {
    getProfileMethod();
  }

  Future<void> getProfileMethod() async {
    final result = await _profileUseCase.getProfile();
    result.when(
      (success) {
        emit(ProfileSuccessState(profile: success));
      },
      (whenError) {
        emit(ProfileErrorState(message: whenError.message));
      },
    );
  }

  Future<void> getSignOut() async {
    final result = await _profileUseCase.signOut();
    result.when(
      (success) {
        emit(SignOutSuccessState());
      },
      (whenError) {
        emit(ProfileErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
