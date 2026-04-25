import 'package:freezed_annotation/freezed_annotation.dart';
part 'role_model.freezed.dart';
part 'role_model.g.dart';

@freezed
abstract class RoleModel with _$RoleModel {
  const factory RoleModel({
    String? name,
  }) = _RoleModel;

  factory RoleModel.fromJson(Map<String, Object?> json) =>
      _$RoleModelFromJson(json);
}


