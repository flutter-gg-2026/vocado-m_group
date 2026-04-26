import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/sub/voice/presentation/pages/voice_feature_widget.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';

class TaskCreatorFeatureScreen extends StatelessWidget {
  const TaskCreatorFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCreatorCubit>();

    return BlocListener<TaskCreatorCubit, TaskCreatorState>(
      listenWhen: (previous, current) =>
          current is TaskCreatorSuccessState ||
          current is TaskCreatorErrorState ||
          current is AddTaskSuccessState,
      listener: (context, state) async {
        if (state is TaskCreatorSuccessState) {
          final json = await context.push(
            Routes.taskDetails,
            extra: state.json,
          );

          if (json != null) {
            cubit.addTask(json: json as Map<String, dynamic>);
          }
        }

        if (state is AddTaskSuccessState) {
          if (context.mounted) {
            context.showSnackBar("Task added successfully", isError: false);
          }
        }

        if (state is TaskCreatorErrorState) {
          if (context.mounted) {
            context.push(Routes.errorState);
          }
        }
      },

      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add A Voice Task",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "Add your task to your team member by recording your voice.\n"
                    "please make sure to mention a member name that you're assigning this task for",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),

                  SizedBox(height: 40),

                  Center(
                    child: VoiceFeatureWidget(
                      getTask: (json) {
                        cubit.getTask(json: json);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
