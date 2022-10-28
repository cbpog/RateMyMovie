import 'dart:core';

import 'package:tmdb_api/tmdb_api.dart';

class GenresData {
  final int genresData;

  GenresData({
    required this.genresData,
  });
}

class FavoriteGenres {
  final List<GenresData> favoriteGenres;

  FavoriteGenres({required this.favoriteGenres});
}
