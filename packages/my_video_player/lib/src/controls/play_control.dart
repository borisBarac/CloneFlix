// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_player/src/controls/video_control.dart';
import 'package:my_video_player/src/cubit/video_cubit.dart';

class PlayControl extends VideoControl {
  const PlayControl({super.key, required super.iconSize});

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<VideoCubit, NetworkVideoState>(
      buildWhen: (previous, current) {
        return previous.playing != current.playing;
      },
      builder: (_, state) {
        return GestureDetector(
          onTap: BlocProvider.of<VideoCubit>(context).togglePlay,
          child: Icon(
            state.playing ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
            size: iconSize,
          ),
        );
      },
    );
  }
}
