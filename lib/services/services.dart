import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

//https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyBEu3_qDzeTK_FW1JN0I4JZPWsEWVvTU08&
// type=video&q=surfing&maxResult=8
const apiKey = 'AIzaSyBEu3_qDzeTK_FW1JN0I4JZPWsEWVvTU08';
const youtubeBaseUrl = 'https://youtube.googleapis.com/youtube/v3/search';

class Services {
  final String searchKey;
  Services(this.searchKey);

  Future getVideoId() async {
    print('search data');
    var response = await http.get(
        '$youtubeBaseUrl?part=snippet&key=$apiKey&type=video&q=$searchKey&maxResult=8');
    print(response.body);
    if (response.statusCode == 200) {
      print('success');
      List<String> videoIds = new List(5);

      final body = convert.jsonDecode(response.body);
      for (var i = 0; i < 5; i++) {
        //burada youtube bize 5 tane video geldiği için 5 yaptım.Acceptable values are 0 to 50, inclusive. The default value is 5.
        videoIds[i] = body['items'][i]['id']['videoId'];
        for (var j = 0; j < 5; j++) {
          print(videoIds[i]);
        }
      }

      print(
          'this came fro the response as video ID ${body['items'][0]['id']['videoId']}');

      return videoIds;
    } else {
      print(response.statusCode);
    }
  }

  Future getTitle() async {
    print('search data');
    var response = await http.get(
        '$youtubeBaseUrl?part=snippet&key=$apiKey&type=video&q=$searchKey&maxResult=8');
    print(response.body);
    if (response.statusCode == 200) {
      print('success');

      final body = convert.jsonDecode(response.body);
      List<String> videoTitle = new List(5);
      for (var i = 0; i < 5; i++) {
        videoTitle[i] = body['items'][i]['snippet']['title'];
        for (var j = 0; j < 5; j++) {
          print(videoTitle[i]);
        }
      }
      print(
          'this came fro the response as video ID ${body['items'][0]['snippet']['title']}');

      return videoTitle;
    } else {
      print(response.statusCode);
    }
  }

  Future getThumnails() async {
    print('search data');
    var response = await http.get(
        '$youtubeBaseUrl?part=snippet&key=$apiKey&type=video&q=$searchKey&maxResult=8');
    print(response.body);
    if (response.statusCode == 200) {
      print('success');
      // items[0].snippet.title
      final body = convert.jsonDecode(response.body);
      List<String> videoThumbnail = new List(5);

      for (var i = 0; i < 5; i++) {
        videoThumbnail[i] =
            body['items'][i]['snippet']['thumbnails']['default']['url'];
        for (var j = 0; j < 5; j++) {
          print(videoThumbnail[i]);
        }
      }
      print(
          'this came fro the response as video ID ${body['items'][0]['snippet']['title']}');

      return videoThumbnail;
    } else {
      print(response.statusCode);
    }
  }
}
