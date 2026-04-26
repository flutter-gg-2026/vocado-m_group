import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vocado/core/extensions/font_extensions.dart';

class TeamWidget extends StatelessWidget {
  const TeamWidget({
    super.key,
    required this.memberName,
    required this.teamName,
    required this.role,
  });
  final String memberName;
  final String teamName;
  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.sw,
      height: 20.sh,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.purpleAccent,
          Colors.blue.shade300
        ]),
        borderRadius: .circular(16),
      ),
      child: Column(
        spacing: 5,
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.person,size: 10.sizeSH(min: 35, max: 50)),
          Text(memberName, style: TextStyle(color: Colors.white)),
          Text(teamName, style: TextStyle(color: Color(0xff2DC9B0))),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: .circular(8),
              border: Border.all(color: Color(0xff2DC9B0)),
            ),
            child: Text(role, style: TextStyle(color: Color(0xff2DC9B0))),
          ),
        ],
      ),
    );
  }
}
