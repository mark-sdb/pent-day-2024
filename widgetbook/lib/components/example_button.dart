import 'package:flutter/material.dart';
import 'package:pent_day_2024/components/example_button.dart';
import 'package:pent_day_2024/l10n/l10n.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: ExampleButton)
Widget buildCoolButtonUseCase(BuildContext context) {

  final l10nEnabled = context.knobs.boolean(label: 'Enable localization', initialValue: false);
  final label = l10nEnabled ? L10n.of(context).exampleButtonText : context.knobs.string(label: 'Button text', initialValue: 'Click me!');

  return ExampleButton(
    onTap: () {},
    labelText: label,
  );
}
