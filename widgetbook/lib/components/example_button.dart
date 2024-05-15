import 'package:flutter/material.dart';
import 'package:pent_day_2024/components/example_button.dart';
import 'package:pent_day_2024/l10n/l10n.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Default',
  type: ExampleButton,
  designLink: 'https://www.figma.com/design/FHIEGBfRVmrRU1UWkXwyJI/P%26T-dag?node-id=1%3A3&t=73rNYjBislEpq4Pq-1',
)
Widget buildCoolButtonUseCase(BuildContext context) {
  final l10nEnabled = context.knobs.boolean(label: 'Enable localization', initialValue: false);
  final label = l10nEnabled
      ? L10n.of(context).exampleButtonText
      : context.knobs.string(label: 'Button text', initialValue: 'Click me!');

  return ExampleButton(
    onTap: () {},
    labelText: label,
  );
}
