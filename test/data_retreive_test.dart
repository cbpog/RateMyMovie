import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:silver_screen/network/api_key_token.dart';

void main() {
  test('I can access my api data', () async {
    String data = await File('test/movie_beast.json').readAsString();
    expect(
        data,
        startsWith(
            '{"adult":false,"backdrop_path":"/2k9tBql5GYH328Krj66tDT9LtFZ.jpg"'));
  });
  test('I can access the hidden key and token', () {
    final key = ApiKeyToken().key;
    final token = ApiKeyToken().token;
    expect({key, token}, {(startsWith('41187')), (startsWith('eyJhbGc'))});
  });
}
