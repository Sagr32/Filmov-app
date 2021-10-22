import '../../domain/entities/tv.dart';

class TvModel extends Tv {
  final String backdropPath;
  final String firstAirDate;
  final List<int> genreIds;
  final int id;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final num popularity;
  final String posterPath;
  final num voteAverage;
  final int voteCount;

  TvModel({
    required this.backdropPath,
    required this.firstAirDate,
    required this.genreIds,
    required this.id,
    required this.name,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          backdropPath: backdropPath,
          firstAirDate: firstAirDate,
          genreIds: genreIds,
          id: id,
          name: name,
          originCountry: originCountry,
          originalLanguage: originalLanguage,
          originalName: originalName,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory TvModel.fromJson(Map<String, dynamic> json) => TvModel(
        backdropPath: json['backdrop_path'] ?? 'None',
        firstAirDate: json['first_air_date'] as String,
        genreIds: json['genre_ids'].cast<int>(),
        id: json['id'] as int,
        name: json['name'] as String,
        originCountry: json['origin_country'].cast<String>(),
        originalLanguage: json['original_language'] as String,
        originalName: json['original_name'] as String,
        overview: json['overview'] as String,
        popularity: (json['popularity'] as num).toDouble(),
        posterPath: json['poster_path'] as String,
        voteAverage: (json['vote_average'] as num).toDouble(),
        voteCount: json['vote_count'] as int,
      );

  Map<String, dynamic> toJson() => {
        'backdrop_path': backdropPath,
        'first_air_date': firstAirDate,
        'genre_ids': genreIds,
        'id': id,
        'name': name,
        'origin_country': originCountry,
        'original_language': originalLanguage,
        'original_name': originalName,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
