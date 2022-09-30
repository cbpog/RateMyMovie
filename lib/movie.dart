import 'package:tmdb_api/tmdb_api.dart';

class Movies implements {
  final bool isAdultContent;
  final List genres;
  final int movieId;
  final String movieTitle;
  final String movieDescription;
  final String releaseDate;
  final String posterPath;
  List movies = [];

  Movies(
      {
        required this.isAdultContent,
      required this.genres,
      required this.movieId,
      required this.movieDescription,
      required this.movieTitle,
      required this.releaseDate,
      required this.posterPath,
      required this.movies,

      });

  loadMovies() async {
    TMDB movieInfo = TMDB(ApiKeys(apiKey, apiToken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingResults = await movieInfo.v3.trending.getTrending();
    movies = trendingResults['results'];
    print(trendingMovies);
  }
}
