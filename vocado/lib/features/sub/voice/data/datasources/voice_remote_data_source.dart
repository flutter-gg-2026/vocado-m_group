import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/network/dio_client.dart';
import 'package:vocado/core/network/gemini_method.dart';
import 'package:vocado/core/services/voice_service.dart';
import 'package:vocado/features/sub/voice/data/models/voice_model.dart';
import 'package:injectable/injectable.dart';

abstract class BaseVoiceRemoteDataSource {
  Future<bool> startVoice();
  Future<VoiceModel> stopVoice();
  Future<Map<String, dynamic>> transcript(String path);
}

@LazySingleton(as: BaseVoiceRemoteDataSource)
class VoiceRemoteDataSource implements BaseVoiceRemoteDataSource {
  final VoiceService _voiceService;
  final DioClient _dio;

  VoiceRemoteDataSource(this._voiceService, this._dio);

  @override
  Future<bool> startVoice() async {
    try {
      await _voiceService.startRecord();
      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<VoiceModel> stopVoice() async {
    try {
      final voice = await _voiceService.stopRecord();

      return VoiceModel(path: voice!);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<Map<String, dynamic>> transcript(String path) async {
    try {
      final text = await _voiceService.transcribe(path);

      final json = await _dio.parseTask(
        text: text,
        apiKey: "AIzaSyDVPwO96VQOE90WznpvwS7zYEkkmhSzLss",
      );

      return json;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
