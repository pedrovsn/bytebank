import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ByteTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData iconData;
  final TextInputType textInputType;

  ByteTextField(this.controller, {this.label, this.hint, this.iconData, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            icon: iconData != null ? Icon(iconData) : null),
        keyboardType: textInputType != null ? textInputType : TextInputType.text,
      ),
    );
  }
}
