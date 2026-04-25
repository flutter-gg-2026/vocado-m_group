// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TeamModel _$TeamModelFromJson(Map<String, dynamic> json) => _TeamModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  teamlead_id: json['users']['name'] as String,
  teams_members: (json['teams_members'] as List<dynamic>)
      .map((e) => TeamMemberModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TeamModelToJson(_TeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teamlead_id': instance.teamlead_id,
      'teams_members': instance.teams_members,
    };
