// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_nav_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MainNavModel _$MainNavModelFromJson(Map<String, dynamic> json) =>
    _MainNavModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$MainNavModelToJson(_MainNavModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
