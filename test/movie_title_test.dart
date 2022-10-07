import 'dart:convert';
import 'dart:io';
import 'package:silver_screen/api_request.dart';
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

  test('I can get movie genre', () async {
    final json = await File('test/movie_beast.json').readAsString();
    final jsonData = jsonDecode(json);
    final answer = jsonData['genres'][0]['id'];
    expect(answer, 12);
  });
}
