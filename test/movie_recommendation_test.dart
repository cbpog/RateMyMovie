import 'dart:convert';
import 'dart:io';
import 'package:silver_screen/network/api_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silver_screen/movie_responsibilites/genres.dart';
import 'package:silver_screen/movie_responsibilites/movie.dart';
import 'package:silver_screen/movie_responsibilites/user_preference.dart';

void main() async {
  final json = await File('test/trending_list.json').readAsString();
  final trendingList = jsonDecode(json);

  test('I can get a list of movie from the api', () {
    var movieAsList = trendingList['results'] as List;
    var list = movieAsList
        .map<MovieData>((json) => MovieData.fromJson(json))
        .cast<MovieData>()
        .toList();
    final answer = list[0].movieTitle;
    expect(answer, 'Orphan: First Kill');
  });

  test('I can filter non-adult movies from the list of movie', () {
    List<MovieData> filteredList = [];
    var movieAsList = trendingList['results'] as List;
    var list = movieAsList
        .map<MovieData>((json) => MovieData.fromJson(json))
        .cast<MovieData>()
        .toList();
    for (MovieData movie in list) {
      if (movie.isAdultContent == false) {
        filteredList.add(movie);
      }
    }
    final answer = filteredList[1].movieTitle;
    expect(answer, "Bullet Train");
  });

  test('I can filter one genre from the list of movie', () {
    List<MovieData> filteredList = [];
    List<int> userPreference = [53];

    var movieAsList = trendingList['results'] as List;
    var list = movieAsList
        .map<MovieData>((json) => MovieData.fromJson(json))
        .cast<MovieData>()
        .toList();

    for (MovieData movie in list) {
      final apiGenres = movie.genre.toSet();
      if (apiGenres.intersection(userPreference.toSet()).isNotEmpty) {
        filteredList.add(movie);
      }
    }

    for (var i = 0; i < filteredList.length; i++) {
      print(filteredList[i].movieTitle);
    }

    final answer = filteredList[0].movieTitle;
    expect(answer, "Orphan: First Kill");
  });
}
