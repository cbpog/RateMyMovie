import 'dart:core';
import 'package:tmdb_api/tmdb_api.dart';

//Instance of movie object
class MovieData {
  final bool isAdultContent;
  final int movieId;
  final String movieTitle;
  final String movieDescription;
  final String releaseDate;
  final String posterPath;

  MovieData({
    required this.isAdultContent,
    required this.movieId,
    required this.movieDescription,
    required this.movieTitle,
    required this.releaseDate,
    required this.posterPath,
  });

  factory MovieData.fromJson(Map<dynamic, dynamic> json) {
    return MovieData(
      isAdultContent: json['adult'] as bool,
      movieId: json['id'] as int,
      movieDescription: json['overview'] as String,
      movieTitle: json['title'] as String,
      releaseDate: json['release_date'] as String,
      posterPath: json['poster_path'] as String,
    );
  }
}
