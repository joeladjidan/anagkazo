import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../globals/globals.dart';
import '../models/Emissions.dart';
import '../utils/AppColor.dart';
import '../utils/Constant.dart';

class AudioPlayScreen extends StatefulWidget {
  final int songIndex;
  final List songs;

  AudioPlayScreen({super.key, required this.songIndex, required this.songs});
  @override
  State<AudioPlayScreen> createState() => _AudioPlayScreenState();
}

class _AudioPlayScreenState extends State<AudioPlayScreen>
    with WidgetsBindingObserver {
  final player = AudioPlayer();
  int trackIndex = 0;
  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    _init();
  }

  Future<void> _init() async {
    // Inform the operating system of our app's audio attributes etc.
    // We pick a reasonable default for an app that plays speech.
    // final session = await AudioSession.instance;
    // await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    // Try to load audio from a source and catch any errors.
    try {
      var index = this.widget.songIndex;
      this.trackIndex = index;
      var songs = this.widget.songs;
      print(songs[index].url);
      // await player.setAudioSource(AudioSource.uri(Uri.parse(songs[index].url)));
      await player.setUrl(songs[index].url);
      player.play();
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      // Release the player's resources when not in use. We use "stop" so that
      // if the app resumes later, it will still remember what position to
      // resume from.
      player.stop();
    }
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    // Release decoders and buffers back to the operating system making them
    // available for other apps to use.
    player.dispose();
    super.dispose();
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          player.positionStream,
          player.bufferedPositionStream,
          player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  void nextTrack() async {
    if (this.widget.songs.length - 1 >= trackIndex + 1) {
      var songs = this.widget.songs;
      await player.setUrl(songs[trackIndex + 1].url);
      player.play();
      setState(() {
        trackIndex = trackIndex + 1;
      });
    }
  }

  void previousTrack() async {
    if (trackIndex - 1 >= 0) {
      var songs = this.widget.songs;
      await player.setUrl(songs[trackIndex - 1].url);
      player.play();
      setState(() {
        trackIndex = trackIndex - 1;
        if (trackIndex < 0) {
          trackIndex = 0;
        }
      });
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageAuthor(),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: PlayerControl(
                    player,
                    positionDataStream,
                    this.widget.songs[trackIndex].fileName,
                    this.widget.songs[trackIndex].dateObject,
                    nextTrack,
                    previousTrack),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageAuthor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cHght * 0.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/music-for-presentation.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        TitleSection(),
        ArtistPictureSection(),
      ]),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: cHght * 0.3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ANAGKAZO',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: cHght * 0.05,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ArtistPictureSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: cHght * 0.3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
          ),
        ),
        child: Stack(alignment: Alignment.center, children: [
          Positioned(
            top: cHght * 0.05,
            child: Container(
              height: cHght * 0.25,
              width: cWght * 0.25,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Constant.LOGO_PATH),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
        ]));
  }
}

class PlayerControl extends StatelessWidget {
  final AudioPlayer player;
  final Stream<PositionData> positionDataStream;
  final String title;
  final String dateEmission;
  final VoidCallback nextTrack;
  final VoidCallback previousTrack;
  PlayerControl(this.player, this.positionDataStream, this.title,
      this.dateEmission, this.nextTrack, this.previousTrack,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PlayingMusicTitle(title, dateEmission),
          // MusicSliderProgressSection(positionDataStream, player),
          MusicSliderSection(positionDataStream, player),
          // DurationSection(),
          MusicControlButtonSection(player, nextTrack, previousTrack)
        ],
      ),
    );
  }
}

class MusicSliderSection extends StatelessWidget {
  final Stream<PositionData> positionDataStream;
  final AudioPlayer player;
  MusicSliderSection(this.positionDataStream, this.player, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: StreamBuilder<PositionData>(
        stream: positionDataStream,
        builder: (context, snapshot) {
          final durationState = snapshot.data;
          final progress = durationState?.position ?? Duration.zero;
          final total = durationState?.duration ?? Duration.zero;
          return Column(
            children: [
              ProgressBar(
                progress: progress,
                total: total,
                barHeight: 10.0,
                baseBarColor: AppColor.blueColor,
                progressBarColor: const Color(0xEE9E9E9E),
                thumbColor: Colors.white60.withBlue(99),
                timeLabelTextStyle: const TextStyle(
                  fontSize: 0,
                ),
                onSeek: (duration) {
                  player.seek(duration);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Text(
                      progress.toString().split(".")[0],
                      style: const TextStyle(
                        color: AppColor.blueColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      total.toString().split(".")[0],
                      style: const TextStyle(
                        color: AppColor.yellowColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class MusicSliderProgressSection extends StatelessWidget {
  final Stream<PositionData> positionDataStream;
  final AudioPlayer player;
  MusicSliderProgressSection(this.positionDataStream, this.player, {Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.only(bottom: 4.0),
      decoration: getRectDecoration(
          BorderRadius.circular(20.0), const Offset(2, 2), 2.0, 0.0),
      //slider bar duration state stream
      child: StreamBuilder<PositionData>(
        stream: positionDataStream,
        builder: (context, snapshot) {
          final durationState = snapshot.data;
          final progress = durationState?.position ?? Duration.zero;
          final total = durationState?.duration ?? Duration.zero;

          return ProgressBar(
            progress: progress,
            total: total,
            barHeight: 10.0,
            baseBarColor: AppColor.blueColor,
            progressBarColor: const Color(0xEE9E9E9E),
            thumbColor: Colors.white60.withBlue(99),
            timeLabelTextStyle: const TextStyle(
              fontSize: 0,
            ),
            onSeek: (duration) {
              player.seek(duration);
            },
          );
        },
      ),
    );
  }
}

class DurationSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 27, right: 27, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '1.08',
            // style: GoogleFonts.lato(
            //   fontWeight: FontWeight.w400,
            //   fontSize: 14.0,
            //   color: Colors.grey,
            // ),
          ),
          Text(
            '3.14',
            // style: GoogleFonts.lato(
            //   fontWeight: FontWeight.w400,
            //   fontSize: 14.0,
            //   color: Colors.grey,
            // ),
          ),
        ],
      ),
    );
  }
}

class MusicControlButtonSection extends StatelessWidget {
  final AudioPlayer player;
  final VoidCallback nextTrack;
  final VoidCallback previousTrack;
  MusicControlButtonSection(this.player, this.nextTrack, this.previousTrack,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // IconButton(
          //   icon: Icon(
          //     Icons.list,
          //     color: Colors.grey,
          //     size: 35,
          //   ),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          IconButton(
            icon: Icon(
              Icons.skip_previous,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              previousTrack();
            },
          ),
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 64.0,
                  height: 64.0,
                  child: const CircularProgressIndicator(),
                );
              } else if (playing != true) {
                return IconButton(
                  icon: const Icon(Icons.play_arrow),
                  iconSize: 64.0,
                  onPressed: player.play,
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  icon: const Icon(Icons.pause),
                  iconSize: 64.0,
                  onPressed: player.pause,
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.replay),
                  iconSize: 64.0,
                  onPressed: () => player.seek(Duration.zero),
                );
              }
            },
          ),
          IconButton(
            icon: Icon(
              Icons.skip_next,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              nextTrack();
            },
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.repeat,
          //     color: Colors.grey,
          //     size: 35,
          //   ),
          //   onPressed: null,
          // ),
        ],
      ),
    );
  }
}

class PlayingMusicTitle extends StatelessWidget {
  final String title;
  final String dateEmission;
  PlayingMusicTitle(this.title, this.dateEmission, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
              color: AppColor.blueColor,
            ),
          ),
          SizedBox(width: 3),
          Text(
            dateEmission,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: AppColor.blueColor,
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration getRectDecoration(BorderRadius borderRadius, Offset offset,
    double blurRadius, double spreadRadius) {
  return BoxDecoration(
    borderRadius: borderRadius,
    color: AppColor.blueColor,
    boxShadow: [
      BoxShadow(
        offset: -offset,
        color: Colors.white24,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      ),
      BoxShadow(
        offset: offset,
        color: Colors.black,
        blurRadius: blurRadius,
        spreadRadius: spreadRadius,
      )
    ],
  );
}
