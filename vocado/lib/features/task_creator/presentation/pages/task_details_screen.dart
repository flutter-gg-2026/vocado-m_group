
import 'package:flutter/material.dart';
import 'package:vocado/features/task_creator/presentation/widgets/button_widget.dart';
import 'package:vocado/features/task_creator/presentation/widgets/text_box_widget.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> json;

  const TaskDetailsScreen({super.key, required this.json});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        actions: [
          Icon(Icons.notifications_none_outlined, color: Colors.lightBlue),
        ],
      ),
      body: Center(
        child: Padding(
          padding: .all(16),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .start,
            children: [
              Text(
                "Task is:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: .bold,
                  color: Colors.black,
                ),
              ),

              Text(json["task"], style: TextStyle(fontSize: 20)),

              SizedBox(height: 20),

              TextBox(text: "Assign To: ${json["assignee"]}"),

              TextBox(text: "Deadline: 12:00pm - ${json["due_date"]}"),

              SizedBox(height: 30),

              ButtonWidget(text: "Approved", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
