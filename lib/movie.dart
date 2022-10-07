import 'dart:core';

//Instance of movie object
class MovieData {
  final bool isAdultContent;
  final int movieId;
  final String movieTitle;
  final String movieOverview;
  final String releaseDate;
  final String posterPath;
  final bool isSuggested;
  final List<int> genre;

  MovieData({
    required this.genre,
    required this.isSuggested,
    required this.isAdultContent,
    required this.movieId,
    required this.movieOverview,
    required this.movieTitle,
    required this.releaseDate,
    required this.posterPath,
  });

  factory MovieData.fromJson(Map<dynamic, dynamic> json) {
    var genreList = json['genre_ids'];
    return MovieData(
      genre: List<int>.from(genreList),
      isSuggested: false,
      isAdultContent: json['adult'] as bool,
      movieId: json['id'] as int,
      movieOverview: json['overview'] as String,
      movieTitle: json['title'] as String,
      releaseDate: json['release_date'] as String,
      posterPath: json['poster_path'] as String,
    );
  }
}
