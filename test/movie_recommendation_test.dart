import 'dart:convert';
import 'dart:io';
import 'package:silver_screen/api_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:silver_screen/movie.dart';
import 'package:silver_screen/user_preference.dart';

void main() async {
  final json = await File('test/trending_list.json').readAsString();
  final trendingList = jsonDecode(json);

  UserPreference user =
      UserPreference(isAdultContent: false, favoriteGenres: [27, 53]);

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
      if (movie.isAdultContent == user.isAdultContent) {
        filteredList.add(movie);
      }
    }
    final answer = filteredList[1].movieTitle;
    expect(answer, "Bullet Train");
  });

  test('I can filter one genre from the list of movie', () {
    List<MovieData> filteredList = [];

    var movieAsList = trendingList['results'] as List;
    var list = movieAsList
        .map<MovieData>((json) => MovieData.fromJson(json))
        .cast<MovieData>()
        .toList();
    for (MovieData movie in list) {
      if (movie.genre == user.favoriteGenres) {
        filteredList.add(movie);
      }
    }
    final answer = filteredList[0].movieTitle;
    expect(answer, "Bullet Train");
  });
}
