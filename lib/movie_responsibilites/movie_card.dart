import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:silver_screen/movie_responsibilites/movie.dart';

import 'movie.dart';

class MovieCard extends StatelessWidget {
  final color;

  MovieCard({required this.color});

  @override
  Widget build(BuildContext context) {
    return Swipable(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
        ),
      ),
    );
  }

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
}
