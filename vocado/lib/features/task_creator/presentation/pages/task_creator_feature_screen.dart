import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_cubit.dart';
import 'package:vocado/features/task_creator/presentation/cubit/task_creator_state.dart';

class TaskCreatorFeatureScreen extends StatelessWidget {
  const TaskCreatorFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskCreatorCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskCreator Feature Screen'),
        actions: [
          IconButton(
            onPressed: () {
              cubit.getSignOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocListener<TaskCreatorCubit, TaskCreatorState>(
        listener: (context, state) {
          if (state is SignOutSuccessState) {
            context.showSnackBar("Log out", isError: false);
            context.go(Routes.auth);
          }
          if (state is TaskCreatorErrorState) {
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
