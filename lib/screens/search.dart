import 'package:flutter/material.dart';
import 'package:find_movie_songs/apis/sweetsoundtrack.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        onSubmitted: (String str) {
          searchMovies(str);
        },
      )),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {},
              title: Text(movies[index]['title']),
              subtitle: Text("http://sweetsoundtrack.com" +
                  movies[index]['attributes']['href']),
            ));
          }),
    );
  }
}
