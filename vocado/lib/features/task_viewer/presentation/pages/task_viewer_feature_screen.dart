import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerFeatureScreen extends StatelessWidget {
  const TaskViewerFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskViewerCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskViewer Feature Screen'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.getSignOutMethod();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocListener<TaskViewerCubit, TaskViewerState>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            context.showSnackBar("Log out", isError: false);
            context.go(Routes.auth);
          }
          if (state is TaskViewerErrorState) {
            context.showSnackBar(state.message, isError: true);
          }
        },
        child: Column(children: [
                
              ],
            ),
      ),
    );
  }
}
