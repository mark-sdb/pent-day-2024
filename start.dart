// ignore_for_file: unnecessary_string_escapes

import 'dart:io';

import 'package:change_case/change_case.dart';
import 'package:dart_console/dart_console.dart';
import 'package:enough_ascii_art/enough_ascii_art.dart' as art;
import 'package:process_run/process_run.dart';

final console = Console();

const defaultColor = ConsoleColor.white;
const inputColor = ConsoleColor.brightYellow;
const errorColor = ConsoleColor.brightRed;

Future<void> main() async {
  console.clearScreen();
  console.setForegroundColor(defaultColor);

  printIntro();

  final userName = ask('Wat is je naam?', 'Je moet wel een naam invullen!');

  final componentName = ask(
    'Hoe heet het component wat je wil gaan maken? (bijv. \'SDBPrimaryButton\' of \'StandardOptionPanel\' of \'SuperAwesomeWidget\')',
    'Je moet wel een component naam invullen!',
  );

  final figmaUrl = ask(
    '''Wat is de Figma URL van het component wat je wil gaan maken? 
    1. Ga naar je Figma file 
    2. Klik op het frame van het component
    3. Klik rechtsboven op "Share"
    4. Klik op "Copy link"''',
    'Je moet wel een Figma URL invullen!',
  );

  final fileName = [
    userName,
    componentName,
  ].map((e) => e.trim().toPascalCase()).toList().join().toSnakeCase();

  final className = componentName.toPascalCase();

  console.writeLine();
  console.writeLine("Copying stuff and moving it to the right place...");

  // Copy the widget file to its place
  final widgetTemplate = File('./stubs/widget.dart').readAsStringSync().replaceAll('NAME', className);
  File('./lib/components/$fileName.dart').writeAsStringSync(widgetTemplate);

  // Copy the widgetbook file to its place
  final widgetbookTemplate = File('./stubs/story.dart')
      .readAsStringSync()
      .replaceAll('NAME', className)
      .replaceAll('FILE', fileName)
      .replaceAll('FIGMAURL', figmaUrl);
  File('./widgetbook/lib/components/$fileName.dart').writeAsStringSync(widgetbookTemplate);

  console.writeLine('Generating files for widgetbook ... ');
  console.writeLine(
      '(run `dart pub run build_runner build` manually if needed when you change the widgetbook UseCase annotations)');

  console.writeLine();
  console.setForegroundColor(ConsoleColor.blue);
  console.writeLine('This will take a couple of seconds!!');
  console.setForegroundColor(defaultColor);

  console.writeLine('Generating files ');
  await Shell().cd('widgetbook').run('dart run build_runner build --delete-conflicting-outputs');

  console.writeLine('Getting dependencies');
  await Shell().run('flutter pub get');
  await Shell().cd('widgetbook').run('flutter pub get');

  console.writeLine('Generating l10n files');
  await Shell().run('flutter gen-l10n');

  console.writeLine();

  console.setForegroundColor(ConsoleColor.green);
  console.writeLine("Done!");
  console.writeLine('Your Flutter widget is in lib/components/$fileName.dart');
  console.writeLine('Your entry for the WidgetBook is in widgetbook/lib/components/$fileName.dart');
  console.setForegroundColor(defaultColor);

  console.writeLine();
  console.writeLine("Have fun coding $userName");
}

void printIntro() {
  var font = File('./big.flf').readAsStringSync();

  console.writeLine('Welkom bij de');

  console.writeLine();
  console.write(art.renderFiglet('FLUTTER', art.Font.text(font)));
  console.write(art.renderFiglet('WORKSHOP', art.Font.text(font)));
  console.writeLine();
}

String ask(String question, String errorMessage) {
  console.writeLine();
  console.setForegroundColor(defaultColor);
  console.writeLine(question);

  console.setForegroundColor(inputColor);
  var output = console.readLine();

  while (output == null || output.isEmpty) {
    console.setForegroundColor(errorColor);
    console.writeErrorLine(errorMessage);

    console.setForegroundColor(defaultColor);
    console.writeLine(question);

    console.setForegroundColor(inputColor);
    output = console.readLine();
  }

  console.resetColorAttributes();
  return output;
}
