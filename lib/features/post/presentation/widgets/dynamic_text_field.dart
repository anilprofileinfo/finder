import 'package:flutter/material.dart';

class DynamicTextField extends StatelessWidget {
  final String hintText;
  final void Function(String) onChanged;
  final TextEditingController? controller;

  const DynamicTextField({
    super.key,
    required this.hintText,
    this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller ?? TextEditingController(),
      onChanged: onChanged,
      decoration: InputDecoration(hintText: hintText),
      validator: (v) {
        if (v == null || v.trim().isEmpty) return 'Please enter something';
        return null;
      },
    );
  }
}
