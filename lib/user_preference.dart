import 'dart:core';
import 'package:tmdb_api/tmdb_api.dart';

//Instance of movie object
class UserPreference {
  final bool isAdultContent;
  final List<int> favoriteGenres;

  UserPreference({
    required this.isAdultContent,
    required this.favoriteGenres,
  });
}
