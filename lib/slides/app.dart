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
            title: 'Wat gaan we doen?',
            subtitle: 'Flutteren uiteraard, maar hoe dan..',
            bullets: const [
              '10 min - Introductie',
              '05 min - Workstation prep (Flutter, git e.d.)',
              '35 min - Figma componenten omzetten naar Flutter',
              '10 min - Alles verzamelen en samen eindresultaat bekijken',
            ],
            transition: _defaultTransition,
          ),
          BulletsSlide(
            title: 'Introductie',
            subtitle: 'Flutteren 101',
            bulletByBullet: true,
            bullets: const [
              '- Alles is een widget',
              '- Constraints go down, sizes go up (https://docs.flutter.dev/ui/layout/constraints)',
              '- WidgetBook (https://ui.pent.day)',
              '- Example component (./lib/components/example_button.dart)',
              '- Gebruik de documentatie en duik de sources in (cmd/ctrl + click)',
              '- Bij vragen of problemen, vraag het ons!',
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
              '- Gebruik je gemaakte figma file van vanochtend of https://figma.pent.day'
                  '- Geen externe packages gebruiken',
              '- Probeer zo dicht mogelijk bij het design te blijven\n  (Gebruik de Widgetbook Figma addon)',
              '\nExtras om te kunnen uitwerken:',
              '    - Dark/Light mode',
              '    - Je component responsive maken',
            ],
            transition: _defaultTransition,
          ),
          WorkshopSlide(),
        ],
      ),
    );
  }
}
