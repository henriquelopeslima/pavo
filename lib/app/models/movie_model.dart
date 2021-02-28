import 'dart:convert';

class MovieModel {
  String title;
  String posterPath;
  MovieModel({
    this.title,
    this.posterPath,
  });

  String get fullImageUrl => (posterPath != null)
      ? 'https://image.tmdb.org/t/p/w200$posterPath'
      : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png';

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovieModel(
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));
}
