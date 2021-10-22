import 'package:flutter/material.dart';

/// image placeholder if there is no image provided
const String kImagePlaceHolder = 'https://bit.ly/34gLECx';

/// Top Rated Movies label or String
const String kTopRatedMovies = 'Top Rated Movies';

/// Trending Movies label or String
const String kTrendingMovies = 'Trending movies';

/// Soon Movies label or String
const String kSoonMovies = 'Soon Movies';

/// Search label or String
const String kSearch = 'Search';

/// Release Date label or String
const String kReleaseDate = 'Release Date';

/// Popularity label or String
const String kPopularity = 'Popularity';

/// Rate label or String
const String kRate = 'Rate';

/// Popular Tv label or String
const String kPopularTv = 'Popular Tv Show';

/// Top Rated Tv label or String
const String kTopRatedTv = 'Top Rated Tv';

/// Trending Tv label or String
const String kTrendingTv = 'Trending Tv';

/// Imdb link
const String kImdbLink = 'https://www.imdb.com/name/';

/// project link on Github
const String kGithubLink = 'https://github.com/Sagr32/Filmov-app';

/// Linkedin link
const String kLinkedinLink = 'https://www.linkedin.com/in/mohamed-sagr/';

/// app link on google play
const String kAppLink =
    'https://play.google.com/store/apps/details?id=com.sagrkai.filmov';

/// default error message for now only
const String kErrorMessage = 'Something went wrong, please try again later';

/// return color to decorate
/// rating card background color
Color getRateBackgroundColor(double rate) {
  if (rate < 5.0) {
    return Colors.red;
  } else if (rate < 6.8) {
    return Colors.yellow;
  } else if (rate < 7.3) {
    return Colors.blue;
  } else {
    return Colors.green;
  }
}
