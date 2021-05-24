import 'package:flutter/material.dart';
import 'package:find_movie_songs/apis/sweetsoundtrack.dart';
import 'package:url_launcher/url_launcher.dart';

class Songs extends StatefulWidget {
  @override
  SongState createState() => SongState();
}

class SongState extends State<Songs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Songs in the movie"),
      ),
      body: ListView.builder(
          itemCount: songs.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {
                searchOnYouTube(songs[index]);
              },
              title: Text(songs[index]),
            ));
          }),
    );
  }
}

void searchOnYouTube(String song) async {
  var url = Uri.parse("https://www.youtube.com/results?search_query=$song");
  if (await canLaunch(url.toString())) {
    await launch(url.toString());
  }
}
