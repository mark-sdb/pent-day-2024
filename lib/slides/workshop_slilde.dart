import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/column.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/constraints.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/project_prep.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/row.dart';
import 'package:pent_day_2024/slides/cheatsheet_items/stateless_widget.dart';
import 'package:slick_slides/slick_slides.dart';

class WorkshopSlide extends Slide {
  WorkshopSlide()
      : super(
          builder: (context) => const ContentLayout(
            title: Text("Workshop"),
            subtitle: Text('Cheatsheet'),
            content: _WorkshopContent(),
          ),
        );
}

class _WorkshopContent extends StatefulWidget {
  const _WorkshopContent();

  @override
  State<_WorkshopContent> createState() => _WorkshopContentState();
}

class _WorkshopContentState extends State<_WorkshopContent> {
  final controller = PageController();
  late Timer timer;
  int currentPage = 0;

  final items = [
    const ProjectPrepItem(),
    const StatelessWidgetItem(),
    const ColumnItem(),
    const ConstrainedItem(),
    const RowItem(),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 30),
      (timer) {
        int nextPage = currentPage + 1;
        if (nextPage >= items.length) {
          nextPage = 0;
        }
        currentPage = nextPage;

        if (!mounted || controller.hasClients == false) {
          timer.cancel();
          return;
        }

        controller.animateToPage(
          currentPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: PageView(
              controller: controller,
              children: items,
            ),
          ),
          const Expanded(flex: 1, child: _Timer()),
        ],
      ),
    );
  }
}

class _Timer extends StatefulWidget {
  const _Timer();

  @override
  __TimerState createState() => __TimerState();
}

class __TimerState extends State<_Timer> {
  final _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.maxWidth / 1.5;
        return GestureDetector(
          onTap: () {
            if (_controller.isStarted) {
              _controller.pause();
            } else {
              _controller.start();
            }
          },
          child: Container(
            width: size,
            height: size,
            color: Colors.transparent,
            padding: const EdgeInsets.all(16.0),
            child: CircularCountDownTimer(
              duration: 60 * 35,
              initialDuration: 0,
              isReverse: true,
              controller: _controller,
              width: size,
              height: size,
              ringColor: Colors.grey[300]!,
              ringGradient: null,
              fillColor: Colors.deepOrange[100]!,
              fillGradient: null,
              backgroundColor: Colors.deepOrange[500],
              backgroundGradient: null,
              strokeWidth: 15.0,
              strokeCap: StrokeCap.round,
              textStyle: TextStyle(fontSize: size / 5, color: Colors.white, fontWeight: FontWeight.bold),
              textFormat: CountdownTextFormat.MM_SS,
              isReverseAnimation: false,
              isTimerTextShown: true,
              autoStart: false,
              timeFormatterFunction: (defaultFormatterFunction, duration) {
                if (duration.inSeconds == 0) {
                  return "Start";
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
            ),
          ),
        );
      },
    );
  }
}
