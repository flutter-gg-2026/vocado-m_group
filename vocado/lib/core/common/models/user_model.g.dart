// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  authId: json['auth_id'] as String,
  email: json['email'] as String,
  createdAt: json['created_at'] as String,
  name: json['name'] as String,
  role: (json['role'] as num).toInt(),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'auth_id': instance.authId,
      'email': instance.email,
      'created_at': instance.createdAt,
      'name': instance.name,
      'role': instance.role,
    };
