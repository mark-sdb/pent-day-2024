import 'package:flutter/material.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/item.dart';

class StatelessWidgetItem extends StatelessWidget {
  const StatelessWidgetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheatSheetItem(
      code: '''
/// Standard StatelessWidget example.

class ExampleWidget extends StatelessWidget {
  const ExampleWidget();

  @override
  Widget build(BuildContext context) {
    return Container(); // Your widget here
  }
}
''',
    );
  }
}
