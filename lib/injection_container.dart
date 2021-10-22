import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/Credits/data/datasources/credit_remote_data_source.dart';
import 'features/Credits/data/repositories/credit_repository_impl.dart';
import 'features/Credits/domain/repositories/credits_repository.dart';
import 'features/Credits/domain/usecases/get_movie_credits.dart';
import 'features/Credits/domain/usecases/get_person_details.dart';
import 'features/Credits/domain/usecases/get_tv_credits.dart';
import 'features/Credits/presentation/bloc/movie_credit/movie_credit_bloc.dart';
import 'features/Credits/presentation/bloc/person_details/person_details_bloc.dart';
import 'features/Credits/presentation/bloc/tv_credit/tv_credit_bloc.dart';
import 'features/movie/data/datasources/movie_remote_datasource.dart';
import 'features/movie/data/repositories/movie_repository_impl.dart';
import 'features/movie/domain/repositories/movie_repository.dart';
import 'features/movie/domain/usecases/get_movies_for_person.dart';
import 'features/movie/domain/usecases/get_popular_movies.dart';
import 'features/movie/domain/usecases/get_recommendation_movies.dart';
import 'features/movie/domain/usecases/get_soon_movies.dart';
import 'features/movie/domain/usecases/get_top_rated_movies.dart';
import 'features/movie/domain/usecases/get_trending_movies.dart';
import 'features/movie/domain/usecases/search_movies.dart';
import 'features/movie/presentation/bloc/movies_for_person/movies_for_person_bloc.dart';
import 'features/movie/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'features/movie/presentation/bloc/recommendation_movies/recommendation_movies_bloc.dart';
import 'features/movie/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'features/movie/presentation/bloc/soon_movies/soon_movies_bloc.dart';
import 'features/movie/presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'features/movie/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'features/tv/data/datasources/tv_remote_data_source.dart';
import 'features/tv/data/repositories/tv_repository_impl.dart';
import 'features/tv/domain/repositories/tv_repository.dart';
import 'features/tv/domain/usecases/get_popular_tv.dart';
import 'features/tv/domain/usecases/get_recommendation_tv.dart';
import 'features/tv/domain/usecases/get_top_rated_tv.dart';
import 'features/tv/domain/usecases/get_trending_tv.dart';
import 'features/tv/presentation/bloc/popular_tv/popular_tv_bloc.dart';
import 'features/tv/presentation/bloc/recommendation_tv/recommendation_tv_bloc.dart';
import 'features/tv/presentation/bloc/top_rated_tv/top_rated_tv_bloc.dart';
import 'features/tv/presentation/bloc/trending_tv/trending_tv_bloc.dart';

final GetIt sl = GetIt.instance;
void init() {
//! Feature
  registerMovieFeature();
  registerCreditFeature();
  registerTvFeature();
//! Extenral
  sl.registerLazySingleton(() => http.Client());
  
}

/// Register Movie Feature
/// [Bloc,Repository,data source]
registerMovieFeature() {
// Movie Bloc

  sl.registerFactory<PopularMoviesBloc>(
    () => PopularMoviesBloc(
      popularUseCase: sl(),
    ),
  );

  sl.registerFactory<RecommendationMoviesBloc>(
    () => RecommendationMoviesBloc(
      recommendationUseCase: sl(),
    ),
  );

  sl.registerFactory<SoonMoviesBloc>(
    () => SoonMoviesBloc(
      soonUseCase: sl(),
    ),
  );
  sl.registerFactory<TopRatedMoviesBloc>(
    () => TopRatedMoviesBloc(
      topRatedUseCase: sl(),
    ),
  );

  sl.registerFactory<TrendingMoviesBloc>(
    () => TrendingMoviesBloc(
      trendingUseCase: sl(),
    ),
  );
  sl.registerFactory<SearchMoviesBloc>(
    () => SearchMoviesBloc(
      searchUseCase: sl(),
    ),
  );

  sl.registerFactory<MoviesForPersonBloc>(
    () => MoviesForPersonBloc(
      moviesForPersonUseCase: sl(),
    ),
  );
  // use cases

  // use cases

  sl.registerLazySingleton(
    () => GetPopularMovies(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetMoviesForPerson(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetRecommendationMovies(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetSoonMovies(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetTopRatedMovies(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetTrendingMovies(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => SearchMovies(
      sl(),
    ),
  );
  // Repository

  sl.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(movieRemoteDataSource: sl()));
  // data source
  // Datasource
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: sl()));
}

/// Register Credit Feature
/// [Bloc,Repository,data source]
registerCreditFeature() {
  // Credits Bloc
  sl.registerFactory<MovieCreditBloc>(
    () => MovieCreditBloc(
      movieCreditUseCase: sl(),
    ),
  );

  sl.registerFactory<PersonDetailsBloc>(
    () => PersonDetailsBloc(
      personDetailsUseCase: sl(),
    ),
  );
  sl.registerFactory<TvCreditBloc>(
    () => TvCreditBloc(
      tvCreditUseCase: sl(),
    ),
  );
  // use cases
  // credit
  sl.registerLazySingleton(
    () => GetMovieCredit(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetPersonDetails(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetTvCredit(
      sl(),
    ),
  );
  // Credit Repository
  sl.registerLazySingleton<CreditRepository>(
      () => CreditRepositoryImpl(creditRemoteDataSource: sl()));
  // Credit data source
  sl.registerLazySingleton<CreditRemoteDataSource>(
      () => CreditRemoteDataSourceImpl(client: sl()));
}

/// Register TV Feature
/// [Bloc,Repository,data source]
registerTvFeature() {
  //Tv Bloc
  sl.registerFactory<PopularTvBloc>(
    () => PopularTvBloc(
      popularTvUseCase: sl(),
    ),
  );

  sl.registerFactory<RecommendationTvBloc>(
    () => RecommendationTvBloc(
      recommendationTvUseCase: sl(),
    ),
  );
  sl.registerFactory<TopRatedTvBloc>(
    () => TopRatedTvBloc(
      topRatedTvUseCase: sl(),
    ),
  );
  sl.registerFactory<TrendingTvBloc>(
    () => TrendingTvBloc(
      trendingTvUseCase: sl(),
    ),
  );

//tv use cases
  sl.registerLazySingleton(
    () => GetPopularTv(
      sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetRecommendationTv(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetTopRatedTv(
      sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetTrendingTv(
      sl(),
    ),
  );

// tv Repository
  sl.registerLazySingleton<TvRepository>(
      () => TvRepositoryImpl(tvRemoteDataSource: sl()));

// tv data source
  sl.registerLazySingleton<TvRemoteDataSource>(
      () => TvRemoteDataSourceImpl(client: sl()));
}
