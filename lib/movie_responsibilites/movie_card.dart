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
                margin: const EdgeInsets.all(10),
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: displayPoster(movie),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              buildMovieTitle(movie),
              buildRating(movie),
            ],
          ),
        ],
      );

  //Description
  Widget buildBottomHalf(movie) => Row(
        children: [
          const Text("Description"),
          Text(movie.movieOverview),
        ],
      );

  //Title of the Movie
  Widget buildMovieTitle(movie) => Row(
        children: [
          Text(
            movie.movieTitle,
            style: textStyleTitle(),
          ),
          const SizedBox(width: 16),
          Text(
            movie.releaseDate,
            style: textStyleTitle(),
          ),
        ],
      );

  //Display poster on the card
  displayPoster(movie) => Image(
      image:
          NetworkImage('https://image.tmdb.org/t/p/w500${movie.posterPath}'));

  //Display Rating on the card
  Widget buildRating(movie) => Row(
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
        colors: [Colors.lightBlueAccent, Colors.purple],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.7, 1],
      ),
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(16)));

  //Sub text
  textStyleSubText() => const TextStyle(
        fontSize: 15,
        color: Colors.black,
      );

  textStyleTitle() => const TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );
}
