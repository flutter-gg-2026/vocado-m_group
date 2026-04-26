import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.validator,
  });
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        hintText: hintText,
        prefixIcon: icon,
        fillColor: const Color.fromRGBO(98, 42, 141, 1),
        border: OutlineInputBorder(
          borderRadius: .circular(16),
          borderSide: BorderSide(color: const Color.fromRGBO(98, 42, 141, 1)),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      validator: validator,
    );
  }
}
