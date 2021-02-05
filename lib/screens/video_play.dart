import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const apiKey = 'AIzaSyDhYsjPU5j0SjsJsmHsdsDAHPHQGISpRmw';
const youtubeBaseUrl = 'https://www.youtube.com';

class VideoPlay extends StatefulWidget {
  VideoPlay(this.videoId, this.videoTitle);
  final String videoId;
  final String videoTitle;

  @override
  _VideoPlayState createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  YoutubePlayerController _controller;
  bool _isPlayerReady;

  @override
  void initState() {
    super.initState();
    _isPlayerReady = false;
    _controller = YoutubePlayerController(
      initialVideoId:
          widget.videoId, //Burada hata verirse toString() methodunu kullan.
      flags: YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        mute: false,
        autoPlay: true,
      ),
    )..addListener(_listener);
  }
  //

  // List<String> videoList = new List(5);

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {}
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//YoutubePlayerBuilder
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          _isPlayerReady = true;
        },
      ),
      builder: (context, player) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              player,
              Expanded(
                  child: Text(
                widget.videoTitle,
                style: TextStyle(),
              )),
            ],
          ),
        );
      },
    );
  }
}
