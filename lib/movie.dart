class Movies {
  final bool isAdultContent;
  final List genres;
  final int movieId;
  final String movieTitle;
  final String movieDescription;
  final String releaseDate;
  final String posterPath;
  final List movies;

  Movies({
    required this.isAdultContent,
    required this.genres,
    required this.movieId,
    required this.movieDescription,
    required this.movieTitle,
    required this.releaseDate,
    required this.posterPath,
    required this.movies,
  });
}
