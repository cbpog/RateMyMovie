import 'dart:core';

enum GenreName {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  drama,
  family,
  fantasy,
  history,
  horror,
  music,
  mystery,
  romance,
  scienceFiction,
  war,
  western,
  thriller,
}

Map<int, GenreName> genreMap = {
  28: GenreName.action,
  12: GenreName.adventure,
  16: GenreName.animation,
  35: GenreName.comedy,
  80: GenreName.crime,
  99: GenreName.documentary,
  18: GenreName.drama,
  10751: GenreName.family,
  14: GenreName.fantasy,
  36: GenreName.history,
  27: GenreName.horror,
  10402: GenreName.music,
  9648: GenreName.mystery,
  10749: GenreName.romance,
  878: GenreName.scienceFiction,
  53: GenreName.thriller,
  10752: GenreName.war,
  37: GenreName.western,
};

class GenresData {
  final int genresData;

  GenresData({
    required this.genresData,
  });
}

class FavoriteGenres {
  final List<GenresData> favoriteGenresList;

  FavoriteGenres({required this.favoriteGenresList});
}
