import 'package:flutter/material.dart';
import 'package:pent_day_2024/components/example_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ExampleButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return ExampleButton(
    onTap: () {},
    labelText: context.knobs.string(label: 'Button text', initialValue: 'Click me!'),
  );
}
