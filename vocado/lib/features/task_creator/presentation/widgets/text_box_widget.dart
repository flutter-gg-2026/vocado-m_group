import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;

  const TextBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .infinity,
      padding: .all(12),
      margin: .symmetric(vertical: 6),
      decoration: BoxDecoration(
        border: .all(color: Color.fromRGBO(98, 42, 141, 1)),
        borderRadius: .circular(10),
      ),
      child: Text(
        text,
        textAlign: .center,
        style: TextStyle(fontSize: 16, color: Color.fromRGBO(98, 42, 141, 1)),
      ),
    );
  }
}
