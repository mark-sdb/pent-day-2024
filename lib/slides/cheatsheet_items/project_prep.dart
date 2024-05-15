import 'package:flutter/material.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/item.dart';

class ProjectPrepItem extends StatelessWidget {
  const ProjectPrepItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const CheatSheetItem(code: '''

/// Project prep example:
1. Fork the Github project (repo.pent.day)
2. Clone the forked project to your local machine
3. Run `dart start.dart` and follow the instructions

/// If you have any questions, please ask!

/// After changing a designLink please run:
cd widgetbook

dart run build_runner build --delete-conflicting-outputs
''');
  }
}
