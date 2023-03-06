import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeController extends GetxController {
  late YoutubePlayerController controller;
    late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;


    @override
  void onInit() {
    super.onInit();
    controller = YoutubePlayerController(
      initialVideoId: 'nPt8bK2gbaU',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    // if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
    //   setState(() {
    //     _playerState = _controller.value.playerState;
    //     _videoMetaData = _controller.metadata;
    //   });
    // }
  }



  @override
  // void deactivate() {
  //   // Pauses video while navigating to next page.
  //   controller.pause();
  //   super.deactivate();
  // }

  @override
  void dispose() {
    controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }
}