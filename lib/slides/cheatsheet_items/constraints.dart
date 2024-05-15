import 'package:flutter/material.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/item.dart';

class ConstrainedItem extends StatelessWidget {
  const ConstrainedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheatSheetItem(
      code: '''
/// ConstrainedBox example.

@override
Widget build(BuildContext context) {
  return ConstrainedBox(
    constraints: const BoxConstraints(
      maxHeight: 300,
      maxWidth: 300,
      minHeight: 100,
      minWidth: 100,
    ),
    child: Placeholder(), // Your widget here
  );
}
''',
    );
  }
}
