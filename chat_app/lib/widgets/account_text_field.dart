import 'package:flutter/material.dart';

class AccountTextField extends StatelessWidget {
  final bool obscureText;
  final String labelText;
  final Function(String) onChanged;
  TextInputType textInputType = TextInputType.multiline;

  AccountTextField(
      {this.obscureText, this.labelText, this.onChanged, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: labelText,
        ),
        keyboardType: textInputType,
        onChanged: onChanged);
  }
}
