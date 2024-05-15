import 'package:flutter/material.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/item.dart';

class ColumnItem extends StatelessWidget {
  const ColumnItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheatSheetItem(
      code: '''
/// Column example.

@override
Widget build(BuildContext context) {
  return Column(
    // Control the alignment of the children 
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,

    // Add children
    children: const <Widget>[
      Placeholder(),
      Placeholder(),
    ],
  );
}
''',
    );
  }
}
