import 'package:flutter/cupertino.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:silver_screen/movie_responsibilites/movie_card.dart';
import 'package:silver_screen/network/api_request.dart';
import '../movie_responsibilites/movie.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({Key? key}) : super(key: key);
  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  List movieInstance = [];

  Future<List<MovieData>> listOfMovie() async {
    var listOfMovies = await ApiRequest().fetchMovies();
    setState(() {
      movieInstance = listOfMovies;
    });
    return listOfMovies;
  }

  @override
  Widget build(BuildContext context) {
    listOfMovie();
    return displayStackOfCard(movieInstance);
  }

  Widget displayStackOfCard(List listOfMovies) => Stack(
        children: [
          for (MovieData movie in listOfMovies)
            Swipable(child: MovieCard(movie: movie))
        ],
      );
}
