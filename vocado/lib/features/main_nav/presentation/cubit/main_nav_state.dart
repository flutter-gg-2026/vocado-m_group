import 'package:equatable/equatable.dart';

abstract class MainNavState extends Equatable {
  const MainNavState();

  @override
  List<Object?> get props => [];
}

class MainNavInitialState extends MainNavState {
  final int index;

  const MainNavInitialState({this.index = 0});

  @override
  List<Object?> get props => [index];
}

class MainNavSuccessState extends MainNavState {}

class MainNavErrorState extends MainNavState {
  final String message;
  const MainNavErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
