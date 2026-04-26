import 'package:flutter/material.dart';
import 'package:vocado/features/tasks_board/domain/entities/tasks_board_entity.dart';

class TasksBoardWidget extends StatelessWidget {
  const TasksBoardWidget({super.key, required this.tasks});
  final List<TasksBoardEntity> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(tasks[index].task),trailing: Text(tasks[index].status),);
      },
    );
  }
}
