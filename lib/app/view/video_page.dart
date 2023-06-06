// ignore_for_file: library_private_types_in_public_api

import 'package:clone_flix/capabilities_and_policies/capabilities.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:my_video_player/video_player.dart';

// fake local storage
// TODO: USE HIVE
bool _showDismiss = true;

abstract class VideoPage extends Widget {
  const VideoPage(this.videoStream, {super.key});

  final String videoStream;
}

class _WebVideoPage extends StatelessWidget implements VideoPage {
  const _WebVideoPage({required this.videoStream});

  @override
  final String videoStream;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _playerCoreWidget(videoStream),
      );
}

class _MobileVideoPage extends StatefulWidget implements VideoPage {
  const _MobileVideoPage({required this.videoStream});

  @override
  _MobileVideoPageState createState() => _MobileVideoPageState();

  @override
  final String videoStream;
}

class _MobileVideoPageState extends State<_MobileVideoPage> {
  static const _dragSensitivity = 8;

  @override
  void initState() {
    super.initState();
    if (_showDismiss) {
      showDismissMessage();
      _showDismiss = false;
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: GestureDetector(
          child: _playerCoreWidget(widget.videoStream),
          onVerticalDragUpdate: (drag) {
            if (drag.delta.dy > _dragSensitivity) {
              context.pop();
            }
          },
        ),
      );

  void showDismissMessage() {
    Fluttertoast.showToast(
      msg: 'Swipe down to dismiss ',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
    );
  }
}

Widget _playerCoreWidget(String videoStream) => Center(
      child: MyVideoPlayer.initWith(
        videoStream,
        aspectRatio: 16 / 9,
      ),
    );

VideoPage createVideoPage(String stream) {
  final capabilities = GetIt.I.get<Capabilities>();
  return capabilities.useMobilePlayer
      ? _MobileVideoPage(videoStream: stream)
      : _WebVideoPage(videoStream: stream);
}
