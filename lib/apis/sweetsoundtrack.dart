import 'package:web_scraper/web_scraper.dart';

List<Map<String, dynamic>> movies = List<Map<String, dynamic>>.empty();
List<String> songs = List<String>.empty();
final webScraper = WebScraper('http://sweetsoundtrack.com');
List<Map<String, dynamic>> temp = List<Map<String, dynamic>>.empty();
Future<List<Map<String, dynamic>>> searchMovies(String queryMovie) async {
  // 1. take out first character of queryMovie
  var firstChar = queryMovie[0];

  // 2. Get a list of all the movies starting with this character
  if (await webScraper.loadWebPage(
      '/Home/SearchResults?searchString=$firstChar&searchType=1')) {
    temp = webScraper
        .getElement("div.searchresults> ul > li > a", ['href', 'title']);

    // 3. From retrieved list, get a list of only the movies that contains queryMovie
    for (int i = 0; i < temp.length; i++) {
      if (!temp[i]['title']
          .toString()
          .toLowerCase()
          .contains(queryMovie.toLowerCase())) {
        temp.removeAt(i);
        i = 0; // it took me eternity for figure out this small mistake.
      }
    }

    movies = temp.sublist(
        1); // it starts from 1, because it, for some reason was always giving an irrelevant first value

  }
  return movies;
// TODO: get the implementation from Testing.dart file.
}

void getSongs(int movieIndex) async {
  if (await webScraper.loadWebPage(movies[movieIndex]['attributes']['href'])) {
    songs = webScraper.getElementTitle(
        "body > div.container > div.content > div > div > div.col-md-8 > dl > span > dt > span > a");
  }
}
