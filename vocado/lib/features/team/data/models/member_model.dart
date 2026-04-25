import 'package:vocado/features/team/data/models/role_model.dart';
import 'package:vocado/features/team/domain/entities/member_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'member_model.freezed.dart';
part 'member_model.g.dart';

@freezed
abstract class MemberModel with _$MemberModel {
  const factory MemberModel({
    String? id,
    String? name,
    RoleModel? roles,
  }) = _MemberModel;

  factory MemberModel.fromJson(Map<String, Object?> json) =>
      _$MemberModelFromJson(json);
}

extension MemberModelMapper on MemberModel {
  MemberEntity toEntity() {
    return MemberEntity(id: id, name: name, role: roles?.name);
  }
}
