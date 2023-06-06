// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_video_player/src/controls/audio_control.dart';
import 'package:my_video_player/src/controls/control_bar.dart';
import 'package:my_video_player/src/controls/play_control.dart';
import 'package:my_video_player/src/cubit/video_cubit.dart';

void main() {
  group('VideoPlayerControls', () {
    testWidgets('AudioControl can render', (tester) async {
      const testWidget = AudioControl(iconSize: 22);
      await tester.pumpWidget(_wrapInApp(testWidget));
      final audioControl = find.byType(AudioControl);

      expect(audioControl, findsOneWidget);
    });

    testWidgets('PlayerControl can render', (tester) async {
      const testWidget = PlayControl(iconSize: 22);
      await tester.pumpWidget(_wrapInApp(testWidget));
      final audioControl = find.byType(PlayControl);

      expect(audioControl, findsOneWidget);
    });

    testWidgets('ControlBar can render', (tester) async {
      const testWidget = ControlBar();
      await tester.pumpWidget(_wrapInApp(testWidget));
      final audioControl = find.byType(PlayControl);

      expect(audioControl, findsOneWidget);
    });
  });
}

Widget _wrapInApp(Widget child) => MaterialApp(
      home: Scaffold(body: _wrapInVideoCubit(child)),
    );

Widget _wrapInVideoCubit(Widget child) =>
    BlocProvider(create: (context) => VideoCubit(''), child: child);
