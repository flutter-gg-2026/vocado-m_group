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
          context.hideLoading();
          if (state is TaskViewerLoadingState){
            context.showLoading();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: BlocListener<TaskViewerCubit, TaskViewerState>(
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
                  BlocBuilder<TaskViewerCubit, TaskViewerState>(
                    builder: (context, state) {
                      if (state is TaskViewerSuccessState) {
                        return Column(
                          spacing: 16,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "New Tasks",
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("View all"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 10),
                                    scrollDirection: .horizontal,
                                    shrinkWrap: true,
                                    itemCount: state.tasks.length,
                                    itemBuilder: (context, index) {
                                      final task = state.tasks[index];
                                      if (task.status != 'Pending') {
                                        return SizedBox.shrink();
                                      }
                                      return TaskContainer(
                                        task: task.task,
                                        date: task.dueDate,
                                        child: DropdownMenu(
                                          onSelected: (value) {
                                            cubit.changeTaskStatusMethod(
                                              taskId: task.id,
                                              newStatus: value!,
                                            );
                                          },
                                          label: Text("Select Task Status"),
                                          dropdownMenuEntries: [
                                            DropdownMenuEntry(
                                              value: "In Progress",
                                              label: "In Progress",
                                            ),
                                            DropdownMenuEntry(
                                              value: "Done",
                                              label: "Done",
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "Late",
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("View all"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 10),
                                    scrollDirection: .horizontal,
                                    shrinkWrap: true,
                                    itemCount: state.tasks.length,
                                    itemBuilder: (context, index) {
                                      final task = state.tasks[index];
                                      if (task.status != 'Done') {
                                        return SizedBox.shrink();
                                      }
                                      return TaskContainer(
                                        task: task.task,
                                        date: task.dueDate,
                                        child: DropdownMenu(
                                          onSelected: (value) {
                                            cubit.changeTaskStatusMethod(
                                              taskId: task.id,
                                              newStatus: value!,
                                            );
                                          },
                                          label: Text("Select Task Status"),
                                          dropdownMenuEntries: [
                                            DropdownMenuEntry(
                                              value: "In Progress",
                                              label: "In Progress",
                                            ),
                                            DropdownMenuEntry(
                                              value: "Done",
                                              label: "Done",
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "In Progress",
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("View all"),
                                    ),
                                  ],
                                ),
                                ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 10),
                                  shrinkWrap: true,
                                  itemCount: state.tasks.length,
                                  itemBuilder: (context, index) {
                                    final task = state.tasks[index];
                                    if (task.status != 'In Progress') {
                                      return SizedBox.shrink();
                                    }
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                          255,
                                          208,
                                          217,
                                          221,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          task.task,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: .bold,
                                          ),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            Icon(
                                              Icons.flag,
                                              color: Color(0xff2DC9B0),
                                            ),
                                            Text(
                                              task.dueDate.split('T')[0],
                                              style: TextStyle(
                                                color: Color(0xff2DC9B0),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                        trailing: Checkbox(
                                          value: false,
                                          onChanged: (value) {
                                            cubit.changeTaskStatusMethod(
                                              taskId: task.id,
                                              newStatus: "Done",
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: .spaceBetween,
                                  children: [
                                    Text(
                                      "Completed Tasks",
                                      style: TextStyle(
                                        fontWeight: .bold,
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text("View all"),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(width: 10),
                                    scrollDirection: .horizontal,
                                    shrinkWrap: true,
                                    itemCount: state.tasks.length,
                                    itemBuilder: (context, index) {
                                      final task = state.tasks[index];
                                      if (task.status != 'Done') {
                                        return SizedBox.shrink();
                                      }
                                      return TaskContainer(
                                        task: task.task,
                                        date: task.dueDate,
                                        child: DropdownMenu(
                                          onSelected: (value) {
                                            cubit.changeTaskStatusMethod(
                                              taskId: task.id,
                                              newStatus: value!,
                                            );
                                          },
                                          label: Text("Select Task Status"),
                                          dropdownMenuEntries: [
                                            DropdownMenuEntry(
                                              value: "In Progress",
                                              label: "In Progress",
                                            ),
                                            DropdownMenuEntry(
                                              value: "Done",
                                              label: "Done",
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return Text('No Tasks Assigned');
                      }
                    },
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
