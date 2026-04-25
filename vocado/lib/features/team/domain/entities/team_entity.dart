import 'package:equatable/equatable.dart';
import 'package:vocado/features/team/data/models/team_member_model.dart';

class TeamEntity extends Equatable {
  
  final String name;
  final String teamleadName;
  final List<TeamMemberModel> teamMembers;

  const TeamEntity({
  
    required this.name,
    required this.teamleadName,
    required this.teamMembers,
  });

  @override
  List<Object?> get props => [name, teamleadName, teamMembers];
}
