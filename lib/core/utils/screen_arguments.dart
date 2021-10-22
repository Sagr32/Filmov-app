/// Class that hold [Movie] or [Tv] info
/// and pass it to another screen or widget
class ScreenArguments {
  /// Constructor
  ScreenArguments(
      {required this.title,
      required this.backdropPath,
      required this.genreIds,
      required this.overview,
      required this.popularity,
      required this.posterPath,
      required this.voteAverage,
      required this.releaseDate,
      required this.isMovie,
      required this.id});

  /// movie or tv title
  final String title;

  ///  movie or tv backdrop
  final String backdropPath;

  ///  movie or tv title genres id in [int]
  final List<int> genreIds;

  ///  movie or tv title overview
  final String overview;

  ///  movie or tv title popularity
  final num popularity;

  /// movie or tv title poster path
  final String posterPath;

  ///  movie or tv title vote average
  final num voteAverage;

  ///  movie or tv title release date
  final String releaseDate;

  /// check if passed artwork is movie or tv
  final bool isMovie;

  ///  movie or tv id
  final int id;
}
