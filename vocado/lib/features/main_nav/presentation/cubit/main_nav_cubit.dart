import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/main_nav/domain/use_cases/main_nav_use_case.dart';
import 'package:vocado/features/main_nav/presentation/cubit/main_nav_state.dart';

class MainNavCubit extends Cubit<MainNavState> {
  final MainNavUseCase _mainNavUseCase;

  MainNavCubit(this._mainNavUseCase) : super(MainNavInitialState());

  Future<void> getMainNavMethod() async {
    final result = await _mainNavUseCase.getMainNav();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
        //here is when error result
      },
    );
  }

  void changeTab(int index) {
    emit(MainNavInitialState(index: index));
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
