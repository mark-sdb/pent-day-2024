import 'package:flutter/material.dart';
import 'package:slick_slides/slick_slides.dart';

class CheatSheetItem extends StatelessWidget {
  const CheatSheetItem({
    super.key,
    required this.code,
  });

  final String code;

  @override
  Widget build(BuildContext context) {
    return ColoredCode(
      code: code,
      language: 'dart',
    );
  }
}
