// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<NetworkVideoState> {
  VideoCubit(
    String url, {
    bool autoPlay = true,
    bool controlsVisible = false,
  }) : super(
          NetworkVideoState.initialize(
            url: url,
            autoPlay: autoPlay,
            controlsVisible: controlsVisible,
          ),
        ) {
    state.controller.initialize().then((_) {
      emit(
        state.copyWith(
          loaded: true,
        ),
      );
      if (autoPlay) {
        state.controller.play();
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Could not play video -----------------------------------------');
        print(error);
        print(stackTrace);
      }
    });
  }

  void togglePlay() {
    state.playing ? state.controller.pause() : state.controller.play();
    emit(
      state.copyWith(
        playing: !state.playing,
      ),
    );
  }

  void toggleControlsVisibility() {
    emit(
      state.copyWith(
        controlsVisible: !state.controlsVisible,
      ),
    );

    if (state.controlsNotVisible && state.notPlaying) {
      togglePlay();
    }
  }

  void setVolume(
    double value,
  ) {
    state.controller.setVolume(value);
    emit(
      state.copyWith(
        volume: value,
      ),
    );
  }

  void toggleMute() {
    final newState = state.copyWith(
      volume: state.mute ? state.volumeBeforeMute : 0,
      volumeBeforeMute: state.notMute ? state.volume : state.volumeBeforeMute,
    );
    state.controller.setVolume(newState.volume);
    emit(newState);
  }

  @override
  Future<void> close() async {
    await state.controller.dispose();
    return super.close();
  }
}
