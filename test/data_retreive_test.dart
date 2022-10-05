import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('I can access my api data', () async {
    String data = await File('test/movie_beast.json').readAsString();
    expect(
        data,
        startsWith(
            '{"adult":false,"backdrop_path":"/2k9tBql5GYH328Krj66tDT9LtFZ.jpg"'));
  });
}
