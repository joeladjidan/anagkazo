import 'package:get/get.dart';

import 'PlayWithoutGetController.dart';

class PlayerController extends GetxController {
  RxString currentSongTitle = ''.obs;
  RxList songs = [].obs;
  int currentIndex = 0;

  final playWGet = new PlayWithoutGetController();
  @override
  void onInit() {
    super.onInit();
    playWGet.player.currentIndexStream.listen((index) {
      if (index != null) {
        _updateCurrentPlayingSongDetails(index);
      }
    });
  }

  void _updateCurrentPlayingSongDetails(int index) {
    if (songs.isNotEmpty) {
      currentSongTitle = songs[index].fileName;
      currentIndex = index;
    }
  }
}
