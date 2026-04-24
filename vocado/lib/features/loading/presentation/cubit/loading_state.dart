import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingInitialState extends LoadingState {}

class LoadingSuccessState extends LoadingState {}

class LoginSuccessState extends LoadingState {
  final bool isLogging;
  final String? role;
  const LoginSuccessState({required this.isLogging, required this.role});
}

class LoadingErrorState extends LoadingState {
  final String message;
  const LoadingErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
