import 'package:flutter/material.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/item.dart';

class RowItem extends StatelessWidget {
  const RowItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheatSheetItem(
      code: '''
/// Row example.

@override
Widget build(BuildContext context) {
  return Row(
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
