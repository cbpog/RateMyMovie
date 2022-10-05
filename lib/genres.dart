class MovieGenres {
  final int id;
  final String name;

  MovieGenres({required this.id, required this.name});

  factory MovieGenres.fromJson(Map<dynamic, dynamic> json) {
    return MovieGenres(id: json['id'], name: json['name']);
  }
}
