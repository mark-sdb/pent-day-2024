import 'package:figma_frame_inspector/figma_frame_inspector.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgetbook/widgetbook.dart';

enum FigmaPreviewType { disabled, below, behind }

class FigmaSettings {
  final FigmaPreviewType previewType;
  final double opacity;

  FigmaSettings({
    required this.previewType,
    required this.opacity,
  });
}

class FigmaAddon extends WidgetbookAddon<FigmaSettings> {
  FigmaAddon() : super(name: 'Figma');

  final opacityNotifier = ValueNotifier(1.0);

  @override
  List<Field> get fields => [
        FigmaButtonField(name: 'open_in_figma_button'),
        ListField<FigmaPreviewType>(
          name: 'figma_preview_type',
          values: FigmaPreviewType.values,
          initialValue: FigmaPreviewType.disabled,
          labelBuilder: (type) => switch (type) {
            FigmaPreviewType.disabled => 'Disabled',
            FigmaPreviewType.below => 'Below',
            FigmaPreviewType.behind => 'Behind',
          },
        ),
        DoubleSliderField(
          name: 'figma_opacity',
          min: 0.1,
          max: 1.0,
          initialValue: 0.5,
        ),
      ];

  @override
  FigmaSettings valueFromQueryGroup(Map<String, String> group) {
    return FigmaSettings(
      previewType: valueOf('figma_preview_type', group),
      opacity: valueOf('figma_opacity', group) ?? 1.0,
    );
  }

  @override
  Widget buildUseCase(BuildContext context, Widget child, FigmaSettings setting) {
    final figmaUrl = WidgetbookState.of(context).useCase?.designLink;

    if (figmaUrl == null || setting.previewType == FigmaPreviewType.disabled) {
      return child;
    }
    opacityNotifier.value = setting.opacity;

    return FigmaFrameInspector(
      // Static, nothing to see here :-) Only works on P&T day for 1 public project
      // Apply learnings from hacking workshop to prevent this.
      figmaToken: 'figd_jOt_Ii4eLSSV0SL_MBJDVwIqAhLzbGDiGSyGZGVJ',
      frameUrl: figmaUrl,
      scale: 1,
      opacityNotifier: opacityNotifier,
      alignment: switch (setting.previewType) {
        FigmaPreviewType.disabled => AlignmentDirectional.center,
        FigmaPreviewType.below => AlignmentDirectional.bottomCenter,
        FigmaPreviewType.behind => AlignmentDirectional.center,
      },
      child: child,
    );
  }
}

class FigmaButtonField extends Field<String> {
  FigmaButtonField({
    required super.name,
    super.initialValue,
  }) : super(
          type: FieldType.string,
          codec: FieldCodec(
            toParam: (value) => value,
            toValue: (param) => param,
          ),
        );

  @override
  Widget toWidget(BuildContext context, String group, dynamic value) {
    final useCase = WidgetbookState.of(context).useCase;

    final url = useCase?.designLink;

    if (url == null) {
      return const Text('No designLink URL provided');
    }

    return ElevatedButton(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          launchUrl(uri);
        }
      },
      child: const Text('Open in Figma'),
    );
  }
}
