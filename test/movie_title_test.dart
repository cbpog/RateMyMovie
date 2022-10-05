import 'package:flutter/material.dart';
import 'package:silver_screen/api_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('I can pull a movie title from the api', () async {
    final list = await ApiRequest().fetchMovies();
    final answer = list.first.movieTitle;
    expect(answer, 'Orphan: First Kill');
  });
}
