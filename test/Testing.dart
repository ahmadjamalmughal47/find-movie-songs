import 'package:web_scraper/web_scraper.dart';

final webScraper = WebScraper('http://sweetsoundtrack.com');
List<Map<String, dynamic>>? movieNames;
// List<String>? movieSongs;

void main() {
  List<String> name = List<String>.filled(5, "something");
  name.add("something");
  name.add("nothing");
  for (int i = 0; i < name.length; i++) {
    if (name[i].contains("some") || name[i].isEmpty) {
      name.remove(i);
    }

    print(name);
  }
  // fetchMovies();
}

void fetchMovies() async {
//   // Loads web page and downloads into local state of library
  if (await webScraper
      .loadWebPage('/Home/SearchResults?searchString=W&searchType=1')) {
//     // getElement takes the address of html tag/element and attributes you want to scrap from website
//     // it will return the attributes in the same order passed
    movieNames = webScraper
        .getElement("div.searchresults> ul > li > a", ['href', 'title']);

    movieNames?.forEach((element) {
      print(element['title']);
    });

//     // movieNames?.forEach((element) {
//     //   print("http://sweetsoundtrack.com" + element['attributes']['href']);
//     // });
//   }

//   if (await webScraper.loadWebPage("/Movies/w-le-donne-1970")) {
//     movieSongs = webScraper.getElementTitle(
//         "body > div.container > div.content > div > div > div.col-md-8 > dl > span > dt > span > a");

//     movieSongs?.forEach((element) {
//       print(element);
//     });
  }
}
