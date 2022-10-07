import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideo extends StatefulWidget {
  String youtubeUrl;
  YouTubeVideo(this.youtubeUrl);

  @override
  State<YouTubeVideo> createState() => _YouTubeVideoState();
}

class _YouTubeVideoState extends State<YouTubeVideo> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  final bool _isPlayerReady = false;
  late String videoId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blue,
      child: VisibilityDetector(
        key: const Key(""),
        onVisibilityChanged: (info) {
          if (info.visibleFraction == 0) {
            _controller.pause();
          } else {
            _controller.value.isPlaying
                ? _controller.play()
                : _controller.pause();
          }
        },
        child: YoutubePlayerBuilder(
          onEnterFullScreen: () {
            SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          },
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            topActions: <Widget>[
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  _controller.metadata.title,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
            onReady: () {
              _controller.addListener(listener);
            },
            onEnded: (data) {},
          ),
          builder: (context, player) => Scaffold(
            key: _scaffoldKey,
            body: player,
          ),
        ),
      ),
    );
  }
}
