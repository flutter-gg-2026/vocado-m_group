import 'package:equatable/equatable.dart';

abstract class VoiceState extends Equatable {
  const VoiceState();
  @override
  List<Object?> get props => [];
}

class VoiceInitialState extends VoiceState {}

class VoiceProcessing extends VoiceState {}

class VoiceRecording extends VoiceState {}

class VoiceTextLoaded extends VoiceState {
  final Map<String, dynamic> json;
  final String path;

  const VoiceTextLoaded({required this.json, required this.path});

  @override
  List<Object?> get props => [json, path];
}

class VoiceErrorState extends VoiceState {
  final String message;
  const VoiceErrorState(this.message);
  @override
  List<Object?> get props => [message];
}
