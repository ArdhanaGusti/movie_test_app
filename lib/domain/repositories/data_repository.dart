import 'package:dartz/dartz.dart';
import 'package:movie_test_app/data/model/actor_model.dart';
import 'package:movie_test_app/data/model/movie_model.dart';
import 'package:movie_test_app/data/model/tv_series_model.dart';
import 'package:movie_test_app/utils/failure.dart';

abstract class DataRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetail(String id);
  Future<Either<Failure, List<Series>>> getAiringTodaySeries();
  Future<Either<Failure, List<Series>>> getTopRatedSeries();
  Future<Either<Failure, List<Series>>> getPopularSeries();
  Future<Either<Failure, List<Series>>> getOnTheAirSeries();
  Future<Either<Failure, List<Actor>>> getPopularActor();
  Future<Either<Failure, SeriesDetail>> getSeriesDetail(String id);
  Future<Either<Failure, ActorDetail>> getActorDetail(String id);
  Future<Either<Failure, List<Movie>>> getSearchMovies(String query);
  Future<Either<Failure, List<Series>>> getSearchSeries(String query);
}
