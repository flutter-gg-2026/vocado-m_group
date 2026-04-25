import 'package:equatable/equatable.dart';

class TeamMemberEntity extends Equatable {
  final String name;
  final String role;

  const TeamMemberEntity({required this.name, required this.role});
  
  @override
 
  List<Object?> get props => [name,role];
}
