import 'package:flutter/material.dart';
import 'package:pent_day_2024/l10n/app_localizations.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/figma_addon.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      appBuilder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Material(child: child),
        );
      },
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: ThemeData.light()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
        ),
        FigmaAddon(),
        DeviceFrameAddon(devices: [
          Devices.ios.iPhone13,
          Devices.android.onePlus8Pro,
        ]),
        TextScaleAddon(scales: [1.0, 1.5, 2.0]),
        AlignmentAddon(),
        LocalizationAddon(
          locales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          initialLocale: AppLocalizations.supportedLocales.last,
        ),
      ],
      directories: directories,
    );
  }
}
