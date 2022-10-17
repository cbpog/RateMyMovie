import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:silver_screen/movie_responsibilites/movie.dart';

import 'movie.dart';

class MovieCard extends StatelessWidget {
  final MovieData movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.black.withOpacity(.8),
        ),
      ),
    );
  }

  //Poster & movie information
  Widget buildTopHalf(MovieData movie) => Row(
        children: [
          Column(
            children: [displayPoster(movie)],
          ),
          Column(
            children: [
              buildMovieTitle(movie),
              buildRating(movie),
              streamAt(movie),
            ],
          ),
        ],
      );

  //Description
  Widget buildBottomHalf(MovieData movie) => Row(
        children: [
          const Text("Description"),
          Text(movie.movieOverview),
        ],
      );

  Widget buildMovieTitle(MovieData movie) => Row(
        children: [
          Text(
            movie.movieTitle,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            movie.releaseDate,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
        ],
      );

  Widget displayPoster(MovieData movie) =>
      Image(image: NetworkImage(movie.posterPath));

  Widget buildRating(MovieData movie) => Row(
        children: [Icons()],
      );
}
