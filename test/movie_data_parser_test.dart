import 'dart:convert';
import 'dart:io';
import 'package:silver_screen/network/api_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('I can pull a movie from the api', () async {
    final json = await File('test/trending_list.json').readAsString();
    final trendingList = jsonDecode(json);
    final answer = trendingList['results'][0]['title'];
    expect(answer, 'Orphan: First Kill');
  });

  test('I can get movie released date', () async {
    final json = await File('test/movie_beast.json').readAsString();
    final jsonData = jsonDecode(json);
    final answer = jsonData['release_date'];
    expect(answer, '2022-08-11');
  });

  test('I can get a movie genre', () async {
    final json = await File('test/movie_beast.json').readAsString();
    final jsonData = jsonDecode(json);
    final answer = jsonData['genres'][0]['name'];
    expect(answer, 'Adventure');
  });

  test('I can get all of the movie genres', () async {
    final json = await File('test/movie_beast.json').readAsString();
    final jsonData = jsonDecode(json);
    final genreList = [];
    var genreData = jsonData['genres'] as List;
    for (var i = 0; i < genreData.length; i++) {
      genreList.add(genreData[i]['name']);
    }
    expect(genreList, ['Adventure', 'Drama', 'Horror']);
  });

  test('I can get the movie overview', () async {
    final json = await File('test/movie_beast.json').readAsString();
    final jsonData = jsonDecode(json);
    final answer = jsonData['overview'];
    expect(
        answer,
        "A recently widowed man and his two teenage daughters " +
            "travel to a game reserve in South Africa. However, their journey of " +
            "healing soon turns into a fight for survival when a bloodthirsty lion " +
            "starts to stalk them.");
  });

  test('I can get the movie id', () async {
    final json = await File('test/movie_beast.json').readAsString();
    final jsonData = jsonDecode(json);
    final answer = jsonData['id'];
    expect(answer.toString(), '760741');
  });

  test('I can get the poster path', () async {
    final json = await File('test/movie_beast.json').readAsString();
    final jsonData = jsonDecode(json);
    final answer = jsonData['poster_path'];
    expect(answer, "/xIGr7UHsKf0URWmyyd5qFMAq4d8.jpg");
  });
}
