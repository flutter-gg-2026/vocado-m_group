import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vocado/features/team/domain/entities/team_member_entity.dart';
part 'team_member_model.freezed.dart';
part 'team_member_model.g.dart';

@freezed
abstract class TeamMemberModel with _$TeamMemberModel {
  const factory TeamMemberModel({required String name, required String role}) =
      _TeamMemberModel;

  factory TeamMemberModel.fromJson(Map<String, Object?> json) =>
      _$TeamMemberModelFromJson(json);
}

extension TeamModelMapper on TeamMemberModel {
  TeamMemberEntity toTeamMemberEntity() {
    return TeamMemberEntity(name: name, role: role);
  }
}
