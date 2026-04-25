import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/sub/voice/domain/use_cases/voice_use_case.dart';
import 'voice_state.dart';

class VoiceCubit extends Cubit<VoiceState> {
  final VoiceUseCase _voiceUseCase;
  String? path;

  VoiceCubit(this._voiceUseCase) : super(VoiceInitialState());

  Future<void> startVoiceMethod() async {
    final result = await _voiceUseCase.startVoice();

    result.when(
      (success) {
        emit(VoiceRecording());
      },
      (error) {
        emit(VoiceErrorState(error.message));
      },
    );
  }

  Future<void> stopVoiceMethod() async {
    emit(VoiceProcessing());

    final stopResult = await _voiceUseCase.stopVoice();

    stopResult.when(
      (voice) async {
        path = voice.path;

        final transcriptResult = await _voiceUseCase.transcript(voice.path);

        transcriptResult.when(
          (text) {
            emit(VoiceTextLoaded(json: text, path: voice.path));
          },
          (error) {
            emit(VoiceErrorState(error.message));
          },
        );
      },
      (error) {
        emit(VoiceErrorState(error.message));
      },
    );
  }
}
