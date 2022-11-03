import 'package:flutter/material.dart';
import 'package:silver_screen/movie_responsibilities/movie.dart';

class MovieCard extends StatelessWidget {
  final MovieData movie;
  final deviceHeightModifier = 0.6;
  final deviceWidthModifier = 0.85;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: deviceHeight * deviceHeightModifier,
        width: deviceWidth * deviceWidthModifier,
        decoration: movieCardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTopHalf(movie),
            buildBottomHalf(movie),
          ],
        ),
      ),
    );
  }

  //Poster & movie information
  Widget buildTopHalf(movie) => Row(
        children: [
          Column(
            children: [
              Container(
                child: displayPoster(movie),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildMovieTitle(movie),
                displayRating(movie),
              ],
            ),
          ),
        ],
      );

  //Description
  Widget buildBottomHalf(movie) => Column(
        children: [
          Text(
            'Description \n',
            style: textStyleDescription(),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                movie.movieOverview,
                softWrap: true,
              ),
            ),
          )
        ],
      );

  //Includes the release date of the movie
  Widget buildMovieTitle(MovieData movie) => Column(
        children: [
          SizedBox(
            child: Text(
              movie.movieTitle,
              textAlign: TextAlign.left,
              style: textStyleTitle(),
              softWrap: true,
            ),
          ),
          SizedBox(
            width: 177,
            height: 40,
            child: Text(
              movie.releaseDate,
              textAlign: TextAlign.center,
              style: textStyleSubText(),
              softWrap: true,
            ),
          ),
        ],
      );

  displayPoster(MovieData movie) => Container(
        margin: const EdgeInsets.all(10),
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            image: NetworkImage(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}'),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      );

  Widget displayRating(movie) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
          Icon(Icons.star_border),
        ],
      );

  //Card decoration
  movieCardDecoration() => BoxDecoration(
      color: Colors.grey,
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16)));

  //Sub text format
  textStyleSubText() => const TextStyle(
        fontSize: 15,
        color: Colors.black,
      );
  //Title text format
  textStyleTitle() => const TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
  //Description Header text format
  textStyleDescription() => const TextStyle(
        fontSize: 10,
        textBaseline: TextBaseline.ideographic,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
}
