import 'package:flutter/material.dart';

class AccountTextField extends StatelessWidget {
  final bool obscureText;
  final String labelText;
  final Function(String) onChanged;

  AccountTextField({this.obscureText, this.labelText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: labelText,
          ),
          onChanged: onChanged),
    );
  }
}
