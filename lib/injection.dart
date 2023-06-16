import 'package:get_it/get_it.dart';
import 'package:movie_test_app/data/datasource/database_remote_datasource.dart';
import 'package:movie_test_app/data/repositories/data_repository_impl.dart';
import 'package:movie_test_app/domain/repositories/data_repository.dart';
import 'package:movie_test_app/domain/usecase/get_actor_detail.dart';
import 'package:movie_test_app/domain/usecase/get_airing_today_series.dart';
import 'package:movie_test_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_test_app/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_test_app/domain/usecase/get_on_the_air_series.dart';
import 'package:movie_test_app/domain/usecase/get_popular_actor.dart';
import 'package:movie_test_app/domain/usecase/get_popular_movies.dart';
import 'package:movie_test_app/domain/usecase/get_popular_series.dart';
import 'package:movie_test_app/domain/usecase/get_search_movies.dart';
import 'package:movie_test_app/domain/usecase/get_search_series.dart';
import 'package:movie_test_app/domain/usecase/get_series_detail.dart';
import 'package:movie_test_app/domain/usecase/get_top_rated_movies.dart';
import 'package:movie_test_app/domain/usecase/get_top_rated_series.dart';
import 'package:movie_test_app/domain/usecase/get_upcoming_movies.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movie_test_app/presentation/bloc/series/series_bloc.dart';

final locator = GetIt.instance;

void init() {
  //Bloc
  locator.registerFactory(
    () => MovieBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => SeriesBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory(
    () => ActorBloc(
      locator(),
      locator(),
    ),
  );

  //usecase
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetUpcomingMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetAiringTodaySeries(locator()));
  locator.registerLazySingleton(() => GetPopularSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedSeries(locator()));
  locator.registerLazySingleton(() => GetOnTheAirSeries(locator()));
  locator.registerLazySingleton(() => GetPopularActor(locator()));
  locator.registerLazySingleton(() => GetSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetActorDetail(locator()));
  locator.registerLazySingleton(() => GetSearchMovies(locator()));
  locator.registerLazySingleton(() => GetSearchSeries(locator()));

  //repository
  locator.registerLazySingleton<DataRepository>(
    () => DataRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  //datasource
  locator.registerLazySingleton<DatabaseRemoteDataSource>(
    () => DatabaseRemoteDataSourceImpl(
      client: locator(),
    ),
  );

  //helper
  locator.registerFactory(() => http.Client());
}
