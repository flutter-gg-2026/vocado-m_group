import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    super.key,
    required this.task,
    required this.date,
    required this.child
  });

  final String task;
  final String date;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
      width: 200,
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.blue.shade300],
        ),
        borderRadius: .circular(16),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Text(task, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: .bold)),
          Row(
            children: [
              Icon(Icons.flag, color: Color(0xff2DC9B0)),
              Text(
                date.split('T')[0],
                style: TextStyle(color: Color(0xff2DC9B0), fontSize: 16),
              ),
            ],
          ),
          child
        ],
      ),
    );
  }
}
