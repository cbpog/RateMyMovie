import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:silver_screen/movie_responsibilites/movie.dart';

import 'movie.dart';

class MovieCard extends StatelessWidget {
  final MovieData movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.85,
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
                buildRating(movie),
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

  //Title and Release Date of the Movie
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

  //Display poster on the card
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

  //Display Rating on the card
  Widget buildRating(movie) => Row(
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
      gradient: const LinearGradient(
        colors: [Colors.redAccent, Colors.purple],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.7, 1],
      ),
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
