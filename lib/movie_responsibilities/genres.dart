import 'dart:core';

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
