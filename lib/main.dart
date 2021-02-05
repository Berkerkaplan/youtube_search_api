import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_youtube/screens/video_list.dart';
import 'package:flutter_app_youtube/services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Youtube Search'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String getSearching;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for Data',
              ),
              onChanged: (newValue) {
                getSearching = newValue;
              },
            ),
            FlatButton(
              autofocus: true,
              disabledColor: Colors.black,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              color: Colors.lightBlueAccent,
              child: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                print(getSearching);
                List<String> videoId =
                    await Services(getSearching).getVideoId();
                List<String> videoTitle =
                    await Services(getSearching).getTitle();

                List<String> videoThumbnail =
                    await Services(getSearching).getThumnails();
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return VideoList(videoId, videoTitle, videoThumbnail);
                  }));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
