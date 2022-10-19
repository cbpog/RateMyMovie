import 'dart:convert';

import 'package:tmdb_api/tmdb_api.dart';
import 'package:silver_screen/movie_responsibilites/movie.dart';

//Class allows for Api Data request
class ApiRequest {
  List<MovieData> popularMovies = [];
  List<MovieData> trendingMovies = [];
  final String apiKey = '41187f96bab5c76a36c08caf7793a818';
  final String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MTE4N2Y5NmJhYjVjNzZhMzZjMDhjYWY3NzkzYTgxOCIsInN1YiI6IjYzMzQ2OTIyOGEwZTliMDA3YjdjYTlhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qiOBbmxp4eYSOdSpApHL8KsSpQKXVwLIj_emlTYDxDw';

  //Pulling Api Information
  Future<List<MovieData>> fetchMovies() async {
    TMDB apiResponse = TMDB(ApiKeys(apiKey, apiToken));
    var popularData = await apiResponse.v3.movies.getPopular();
    popularMovies = popularData['results']
        .map<MovieData>((x) => MovieData.fromJson(x))
        .toList();
    return popularMovies;
  }

  fetchPoster() async {
    TMDB response = TMDB(ApiKeys(apiKey, apiToken));
    Map posterResults = await response.v3.trending.getTrending();
    return posterResults;
  }
}
