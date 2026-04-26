import 'dart:io';
import 'package:dio/dio.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/v7.dart';

@lazySingleton
class VoiceService {
  final _record = AudioRecorder();
  final _player = AudioPlayer();
  final Dio _dio = Dio();

  void requestPermission() async {
    final hasPermission = await _record.hasPermission(request: true);

    if (!hasPermission) {
      throw PermissionFailure("record not allow");
    }
  }

  Future<void> startRecord() async {
    final Directory tempDir = await getTemporaryDirectory();
    final name = UuidV7().generate();

    await _record.start(
      const RecordConfig(),
      path: '${tempDir.path}/$name.m4a',
    );
  }

  Future<String?> stopRecord() async {
    final path = await _record.stop();
    return path;
  }

  Future<void> startPlayerAudio({required String pathAudio}) async {
    await _player.setFilePath(pathAudio);
    await _player.play();
  }

  Future<void> stopPlayerAudio() async {
    await _player.stop();
  }

  Future<String> transcribe(String path) async {
    const apiKey = "AIzaSyDVPwO96VQOE90WznpvwS7zYEkkmhSzLss";
    final upload = await _dio.post(
      "https://api.gladia.io/v2/upload",
      data: FormData.fromMap({"audio": await MultipartFile.fromFile(path)}),
      options: Options(headers: {"x-gladia-key": apiKey}),
    );
    final audioUrl = upload.data["audio_url"];

    final start = await _dio.post(
      "https://api.gladia.io/v2/pre-recorded",
      data: {"audio_url": audioUrl, "language": "ar"},
      options: Options(
        headers: {"x-gladia-key": apiKey, "Content-Type": "application/json"},
      ),
    );
    final resultUrl = start.data["result_url"];

    await Future.delayed(Duration(seconds: 2));

    final result = await _dio.get(
      resultUrl,
      options: Options(headers: {"x-gladia-key": apiKey}),
    );
    final text = result.data["result"]["transcription"]["full_transcript"];

    return text;
  }
}
