import 'package:flutter/cupertino.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:silver_screen/movie_responsibilites/movie_card.dart';
import 'package:silver_screen/network/api_request.dart';

import '../movie_responsibilites/movie.dart';

class SuggestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return displayStackOfCard(listOfMovie());
  }

  Future<List<MovieData>> listOfMovie() async {
    var listOfMovies = await ApiRequest().fetchMovies();
    return Future.value(listOfMovies);
  }

  Widget displayStackOfCard(var listOfMovies) => Stack(
        children: [
          for (MovieData movie in listOfMovies)
            Swipable(child: MovieCard(movie: movie))
        ],
      );
}
