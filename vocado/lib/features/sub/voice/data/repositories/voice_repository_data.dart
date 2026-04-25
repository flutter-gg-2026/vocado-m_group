
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/sub/voice/data/datasources/voice_remote_data_source.dart';
import 'package:vocado/features/sub/voice/data/models/voice_model.dart';
import 'package:vocado/features/sub/voice/domain/entities/voice_entity.dart';
import 'package:vocado/features/sub/voice/domain/repositories/voice_repository_domain.dart';
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

@LazySingleton(as: VoiceRepositoryDomain)
class VoiceRepositoryData implements VoiceRepositoryDomain {
  final BaseVoiceRemoteDataSource remoteDataSource;

  VoiceRepositoryData(this.remoteDataSource);

  @override
  Future<Result<bool, Failure>> startVoice() async {
    try {
      await remoteDataSource.startVoice();
      return Success(true);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<VoiceEntity, Failure>> stopVoice() async {
    try {
      final response = await remoteDataSource.stopVoice();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
  
  @override
  Future<Result<Map<String,dynamic>, Failure>> transcript(String path)async {
   try {
    final text = await remoteDataSource.transcript(path);
    return Success(text);
  } catch (error) {
    return Error(FailureExceptions.getException(error));
  }
  }
  


}
