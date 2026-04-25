import 'package:equatable/equatable.dart';

class VoiceEntity extends Equatable {
  final String path;

  const VoiceEntity({required this.path});

  @override
  List<Object?> get props => [path];
}
