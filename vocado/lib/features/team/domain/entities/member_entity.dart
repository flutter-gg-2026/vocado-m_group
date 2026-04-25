import 'package:equatable/equatable.dart';

class MemberEntity extends Equatable {
  final String? id;
  final String? name;
  final String? role;

  const MemberEntity({
    required this.id,
    required this.name,
    required this.role,
  });

  @override
  List<Object?> get props => [id, name, role];
}
