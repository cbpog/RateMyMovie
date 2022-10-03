import 'dart:core';

class MovieProperties {
  final bool isAdultContent;
  final List genres;
  final int movieId;
  final String movieTitle;
  final String movieDescription;
  final String releaseDate;
  final String posterPath;

  MovieProperties({
    required this.isAdultContent,
    required this.genres,
    required this.movieId,
    required this.movieDescription,
    required this.movieTitle,
    required this.releaseDate,
    required this.posterPath,
  });

  factory MovieProperties.fromJson(Map<String, dynamic> json) {
    return MovieProperties(
      isAdultContent: json['adult'],
      genres: json['genres'],
      movieId: json['id'],
      movieDescription: json['overview'],
      movieTitle: json['title'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
    );
  }
}
