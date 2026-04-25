import 'package:equatable/equatable.dart';
import 'package:vocado/features/team/domain/entities/member_entity.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';

abstract class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object?> get props => [];
}

class TeamInitialState extends TeamState {}

class TeamSuccessState extends TeamState {
  final List<TeamEntity> team;

  const TeamSuccessState({required this.team});

  @override
  List<Object?> get props => [team];
}

class AddMemberSuccessState extends TeamState {}

class LoadingSuccessState extends TeamState {}

class MemberSuccessState extends TeamState {
  final List<MemberEntity> members;
  const MemberSuccessState({required this.members});
  @override
  List<Object?> get props => [members];
}

class TeamErrorState extends TeamState {
  final String message;
  const TeamErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
