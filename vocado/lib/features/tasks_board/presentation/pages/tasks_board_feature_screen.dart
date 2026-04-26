import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocado/features/tasks_board/presentation/cubit/tasks_board_cubit.dart';
import 'package:vocado/features/tasks_board/presentation/cubit/tasks_board_state.dart';
import 'package:vocado/features/tasks_board/presentation/widgets/tasks_board_widget.dart';

class TasksBoardFeatureScreen extends StatelessWidget {
  const TasksBoardFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasksBoardCubit>();
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Task board'),
          bottom: TabBar(
            onTap: (index) {
              cubit.getTasksBoardMethod(index: index);
            },
            tabs: [
              Tab(text: "In Progress"),
              Tab(text: 'Done'),
              Tab(text: 'Pending'),
            ],
          ),
        ),
        body: BlocBuilder<TasksBoardCubit, TasksBoardState>(
          builder: (context, state) {
            if (state is TasksBoardSuccessState) {
              return TabBarView(
                children: [
                  TasksBoardWidget(tasks: state.tasks),
                  TasksBoardWidget(tasks: state.tasks),
                  TasksBoardWidget(tasks: state.tasks),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
