/// base api url
const String kBaseUrl = 'api.themoviedb.org';

/// api key
const String kApiKey = 'your-api-key';

/// endpoint for trending movies
const String kTrendingMoviesEndpoint = '3/trending/movie/week';

/// endpoint for soon movies
const String kSoonMoviesEndpoint = '3/discover/movie';

/// endpoint for Search
const String kSearchMoviesEndpoint = '3/search/movie';

/// endpoint for popular movies
const String kPopularMoviesEndpoint = '3/movie/popular';

/// endpoint for top rated movies
const String kTopRatedEndpoint = '3/movie/top_rated';

/// endpoint for movie credit
String kMovieCreditEndpoint(String movieId) => '3/movie/$movieId/credits';

/// endpoint for tv credit
String kTvCreditEndpoint(String tvShowId) => '3/tv/$tvShowId/credits';

/// endpoint for person details
String kPersonDetailsEndpoint(String personId) => '3/person/$personId';

/// endpoint for movie recommendations
String kRecommendationEndpoint(String movieId) {
  return '3/movie/$movieId/recommendations';
}

/// endpoint for person's movie
String kMovieForPersonEndpoint(String personId) {
  return '3/person/$personId/movie_credits';
}

/// endpoint for trending tv shows
const String kTrendingTvEndpoint = '3/trending/tv/day';

/// endpoint for tv shows recommendation
String kRecommendationTvEndpoint(String tvShowId) =>
    '3/tv/$tvShowId/recommendations';

/// endpoint for top rated tv shows
const String kTopRatedTvEndpoint = '3/tv/top_rated';

/// endpoint for popular tv shows
const String kPopularTvEndpoint = '3/tv/popular';

/// endpoint for image url full path
String getImagePath(String name) {
  return 'http://image.tmdb.org/t/p/w500/$name';
}
