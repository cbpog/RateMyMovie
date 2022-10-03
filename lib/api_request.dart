import 'package:tmdb_api/tmdb_api.dart';
import 'package:silver_screen/movie.dart';
import 'package:flutter/material.dart';

class ApiRequest {
  List trendingMovies = [];
  List movieDetails = [];
  final String apiKey = '41187f96bab5c76a36c08caf7793a818';
  final String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MTE4N2Y5NmJhYjVjNzZhMzZjMDhjYWY3NzkzYTgxOCIsInN1YiI6IjYzMzQ2OTIyOGEwZTliMDA3YjdjYTlhNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qiOBbmxp4eYSOdSpApHL8KsSpQKXVwLIj_emlTYDxDw';
  late List<MovieProperties> properties;

  fetchMovies() async {
    TMDB apiResponse = TMDB(ApiKeys(apiKey, apiToken));

    Map trendingMovieResults = await apiResponse.v3.trending.getTrending();
    trendingMovies = trendingMovieResults['results'];
    Map<dynamic, dynamic> movieInfo =
        await apiResponse.v3.movies.getDetails(985939);
    properties = movieInfo['title'];

    print(properties);
  }
}
