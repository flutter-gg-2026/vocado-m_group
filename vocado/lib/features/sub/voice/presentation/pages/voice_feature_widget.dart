import 'package:vocado/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vocado/features/sub/voice/presentation/cubit/voice_cubit.dart';
import 'package:vocado/features/sub/voice/presentation/cubit/voice_state.dart';
import 'package:lottie/lottie.dart';

class VoiceFeatureWidget extends StatelessWidget {
  const VoiceFeatureWidget({super.key, required this.getTask});

  final Function(Map<String, dynamic> json) getTask;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VoiceCubit(GetIt.I()),
      child: Builder(
        builder: (context) {
          final cubit = context.read<VoiceCubit>();

          return BlocBuilder<VoiceCubit, VoiceState>(
            builder: (context, state) {
              final isRecording = state is VoiceRecording;
              final isProcessing = state is VoiceProcessing;

              if (state is VoiceTextLoaded) {
                 print(
                  "-----------------------------------------${state.json}----------------------------------",
                );
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  getTask(state.json);
                });
              }

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onLongPress: () async {
                      await cubit.startVoiceMethod();
                    },
                    onLongPressUp: () async {
                      await cubit.stopVoiceMethod();
                    },
                    child: AnimatedScale(
                      duration: Duration(milliseconds: 250),
                      scale: isRecording ? 1.15 : 1.0,
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black, width: 2),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(169, 72, 243, 1),
                              Color.fromRGBO(98, 42, 141, 1),
                            ],
                          ),
                        ),
                        child: Icon(Icons.mic, color: Colors.black, size: 60),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: isRecording
                        ? Lottie.asset(
                            "assets/animation/Voice line _ wave animation.json",
                            repeat: true,
                          )
                        : const SizedBox(),
                  ),

                  const SizedBox(height: 20),

                  if (isProcessing) LoadingWidget(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
