import 'package:flutter/cupertino.dart';
import 'package:silver_screen/movie_responsibilites/movie_card.dart';
import 'package:silver_screen/network/api_request.dart';

import '../movie_responsibilites/movie.dart';

class SuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        for (MovieData movie in listOfMovie()) MovieCard(movie: movie),
      ],
    );
  }

  listOfMovie() async => await ApiRequest().fetchMovies();
}
