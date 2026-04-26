import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/context_extensions.dart';
import 'package:vocado/core/extensions/font_extensions.dart';
import 'package:vocado/core/extensions/string_extensions.dart';
import 'package:vocado/core/navigation/routers.dart';
import 'package:vocado/core/services/user_service.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart';
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_state.dart';
import 'package:vocado/features/task_viewer/presentation/widgets/task_container.dart';

class TaskViewerFeatureScreen extends StatelessWidget {
  const TaskViewerFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TaskViewerCubit>();
    final String userName = GetIt.I.get<UserService>().getUser.name;

    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: .end,
          text: TextSpan(
            text: "Hello, ",
            style: TextStyle(color: Colors.black, fontSize: 16),
            children: [
              TextSpan(
                text: userName,
                style: TextStyle(fontWeight: .bold),
              ),
            ],
          ),
        ),
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
        child: Column(
          children: [
            FilledButton(
              onPressed: () {
                cubit.getTaskViewerMethod();
              },
              child: Text("get user tasks"),
            ),

            BlocBuilder<TaskViewerCubit, TaskViewerState>(
              builder: (context, state) {
                if (state is TaskViewerSuccessState) {
                  return SizedBox(
                    height: 250,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      scrollDirection: .horizontal,
                      shrinkWrap: true,
                      itemCount: state.tasks.length,
                      itemBuilder: (context, index) {
                        final task = state.tasks[index];
                        return TaskContainer(
                          status: task.status,
                          task: task.task,
                          date: task.dueDate,
                          child: DropdownMenu(
                            onSelected: (value) {
                              cubit.changeTaskStatusMethod(taskId: task.id, newStatus: value!);
                            },
                            label: Text("Select Task Status"),
                            dropdownMenuEntries: [
                              DropdownMenuEntry(value: "In Progress", label: "In Progress"),
                              DropdownMenuEntry(value: "Done", label: "Done"),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Text('No Tasks Assigned');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
