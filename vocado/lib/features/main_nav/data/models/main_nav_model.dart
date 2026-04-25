import 'package:vocado/features/main_nav/domain/entities/main_nav_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'main_nav_model.freezed.dart';
part 'main_nav_model.g.dart';

@freezed
abstract class MainNavModel with _$MainNavModel {
  const factory MainNavModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _MainNavModel;

  factory MainNavModel.fromJson(Map<String, Object?> json) => _$MainNavModelFromJson(json);
}



extension MainNavModelMapper on MainNavModel {
  MainNavEntity toEntity() {
    return MainNavEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
