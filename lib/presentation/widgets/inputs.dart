import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.label,
    required this.icon,
    this.onChanged,
    this.errorText,
  });

  final String label;
  final IconData icon;
  final String? errorText;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: errorText,
        label: Text(label),
        suffixIcon: Icon(icon),
      ),
    );
  }
}
