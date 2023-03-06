import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class PlayWithoutGetController {
  final AudioPlayer player = AudioPlayer();
  Stream<DurationState> get durationStateStream =>
      Rx.combineLatest2<Duration, Duration?, DurationState>(
          player.positionStream,
          player.durationStream,
          (position, duration) => DurationState(
              position: position, total: duration ?? Duration.zero));
}

//duration class
class DurationState {
  DurationState({this.position = Duration.zero, this.total = Duration.zero});
  Duration position, total;
}
