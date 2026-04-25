import 'package:vocado/features/sub/voice/domain/entities/voice_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'voice_model.freezed.dart';
part 'voice_model.g.dart';

@freezed
abstract class VoiceModel with _$VoiceModel {
  const factory VoiceModel({required String path}) = _VoiceModel;

  factory VoiceModel.fromJson(Map<String, Object?> json) =>
      _$VoiceModelFromJson(json);
}

extension VoiceModelMapper on VoiceModel {
  VoiceEntity toEntity() {
    return VoiceEntity(path: path);
  }
}
