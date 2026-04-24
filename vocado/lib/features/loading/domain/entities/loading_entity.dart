import 'package:equatable/equatable.dart';

class LoadingEntity extends Equatable {
  final bool isLogging;
  final String? role;


  const LoadingEntity({
    required this.isLogging,
    required this.role,
  });

  @override
  List<Object?> get props => [isLogging, role];
}
