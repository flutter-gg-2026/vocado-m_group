import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:vocado/features/sign_up/presentation/cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitialState());

  Future<void> getSignUpMethod({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await _signUpUseCase.getSignUp(
      email: email,
      name: name,
      password: password,
    );
    result.when(
      (success) {
        emit(SignUpSuccessState());
      },
      (whenError) {
        emit(SignUpErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
