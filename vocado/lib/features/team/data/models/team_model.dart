import 'package:vocado/features/team/data/models/team_member_model.dart';
import 'package:vocado/features/team/domain/entities/team_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  const factory TeamModel({
    required int id,
    required String name,
    required String teamlead_id,
    required List<TeamMemberModel> teams_members,
  }) = _TeamModel;

  factory TeamModel.fromJson(Map<String, Object?> json) =>
      _$TeamModelFromJson(json);
}

extension TeamModelMapper on TeamModel {
  TeamEntity toTeamEntity() {
    return TeamEntity(
      name: name,
      teamMembers: teams_members,
      teamleadName: teamlead_id,
    );
  }
}
