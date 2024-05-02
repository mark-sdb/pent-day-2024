import 'package:flutter/material.dart';

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.onTap,
    required this.labelText,
  });

  final VoidCallback onTap;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(labelText),
    );
  }
}
