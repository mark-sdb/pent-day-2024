import 'package:flutter/material.dart';
import 'package:pent_day_2024/slides/workshop_slilde.dart';
import 'package:slick_slides/slick_slides.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SlickSlides.initialize();

  runApp(const SlidesApp());
}

// Setup a default transition.
const _defaultTransition = SlickFadeTransition(color: Colors.black);

class SlidesApp extends StatelessWidget {
  const SlidesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Workshop',
      home: SlideDeck(
        slides: [
          TitleSlide(
            title: 'Flutter',
            subtitle: 'Welcome to the workshop!',
            transition: _defaultTransition,
          ),
          PersonSlide(
            title: 'Fabulous Flutterista',
            name: 'Corina Bodnariuc',
            image: const AssetImage('assets/slides/corina.png'),
            transition: _defaultTransition,
          ),
          PersonSlide(
            title: 'Fluttermeister extraordinaire',
            name: 'Mark Mooibroek',
            image: const AssetImage('assets/slides/mark.png'),
            transition: _defaultTransition,
          ),
          BulletsSlide(
            title: 'What are we going to do?',
            subtitle: 'Flutteren ofcourse, but.. but how..',
            bullets: const [
              '10 min - Introduction',
              '05 min - Workstation prep (Flutter, git, etc.)',
              '35 min - Converting Figma components to Flutter',
              '10 min - Gather everything and review the final result together',
            ],
            transition: _defaultTransition,
          ),
          BulletsSlide(
            title: 'Introductie',
            subtitle: 'Flutteren 101',
            bulletByBullet: true,
            bullets: const [
              '- Everything is a widget',
              '- Constraints go down, sizes go up (https://docs.flutter.dev/ui/layout/constraints)',
              '- WidgetBook (https://ui.pent.day)',
              '- Example component (./lib/components/example_button.dart)',
              '- Use the documentation and dive into the sources (cmd/ctrl + click)',
              '- If you have any questions or issues, ask us!',
            ],
            transition: _defaultTransition,
          ),
          BulletsSlide(
            title: 'Workstation prep',
            subtitle: 'What do we need?',
            bullets: const [
              '- Flutter SDK (https://flutter.dev/docs/get-started/install)',
              '- Git (en een Github account)',
              '- IDE (VSCode, IntelliJ)',
              '',
              '1. Fork repo: https://repo.pent.day',
              '2. Run `flutter pub get`',
              '3. Execute: `dart start.dart` (project root)',
            ],
            transition: _defaultTransition,
          ),
          BulletsSlide(
            title: 'Figma => Flutter',
            subtitle: 'Rules of the game!',
            bulletByBullet: true,
            bullets: const [
              '- Use your created Figma file from this morning or https://figma.pent.day',
              '- Do not use external packages',
              '- Try to stay as close as possible to the design\n  (Use the Widgetbook Figma addon)',
              '\nExtras to work on:',
              '    - Dark/Light mode',
              '    - Make your component responsive',
            ],
            transition: _defaultTransition,
          ),
          WorkshopSlide(),
        ],
      ),
    );
  }
}
