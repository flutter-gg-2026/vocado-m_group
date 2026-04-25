import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/sub/voice/domain/entities/voice_entity.dart';

abstract class VoiceRepositoryDomain {
  Future<Result<bool, Failure>> startVoice();
  Future<Result<VoiceEntity, Failure>> stopVoice();
  Future<Result<Map<String,dynamic>, Failure>> transcript(String path);
}
