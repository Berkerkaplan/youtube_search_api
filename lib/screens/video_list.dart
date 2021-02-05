import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_youtube/screens/video_play.dart';

class VideoList extends StatefulWidget {
  VideoList(this.videoId, this.videoTitle, this.videoThumbnail);

  final List<String> videoId;
  final List<String> videoTitle;
  final List<String> videoThumbnail;

  @override
  _VideoListState createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: widget.videoTitle.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return VideoPlay(
                            widget.videoId[index], widget.videoTitle[index]);
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          CachedNetworkImage(
                            imageUrl: widget.videoThumbnail[index],
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Flexible(
                            child: Text(
                              widget.videoTitle[index],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
