import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
  Future _videoPlayer() async {
    final String url1 = 'https://www.youtube.com/watch?v=${widget.videoId}';
    final url = url1;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      debugPrint('Link cant open');
    }
  }
  // https://www.youtube.com/watch?v=hko1xYkzmBM

//YoutubePlayerBuilder
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              _videoPlayer();
            },
            child: Text('Open the Video'),
          ),
        ),
      ),
    );
  }
}
