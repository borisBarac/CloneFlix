// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_player/src/controls/control_bar.dart';
import 'package:my_video_player/src/cubit/video_cubit.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatelessWidget {
  const MyVideoPlayer._(
    this.url, {
    required this.aspectRatio,
  });

  static Widget initWith(
    String url, {
    required double aspectRatio,
    bool autoPlay = true,
    bool? controlsVisible,
  }) {
    return BlocProvider(
      create: (_) {
        return VideoCubit(
          url,
          autoPlay: autoPlay,
          controlsVisible: controlsVisible ?? !autoPlay,
        );
      },
      child: MyVideoPlayer._(
        url,
        aspectRatio: aspectRatio,
      ),
    );
  }

  final String url;
  final double aspectRatio;

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<VideoCubit, NetworkVideoState>(
      builder: (_, state) {
        return AnimatedSwitcher(
          duration: _animationDuration,
          child: AspectRatio(
            key: ValueKey(state.loaded),
            aspectRatio: aspectRatio,
            child: state.notLoaded
                ? const Center(child: CircularProgressIndicator())
                : _buildVideo(state),
          ),
        );
      },
    );
  }

  Stack _buildVideo(
    NetworkVideoState state,
  ) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        VideoPlayer(
          state.controller,
        ),
        const ControlBar(),
      ],
    );
  }
}

const _animationDuration = Duration(milliseconds: 100);
