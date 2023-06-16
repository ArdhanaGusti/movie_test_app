import 'package:dartz/dartz.dart';
import 'package:movie_test_app/data/datasource/database_remote_datasource.dart';
import 'package:movie_test_app/data/model/actor_model.dart';
import 'package:movie_test_app/data/model/movie_model.dart';
import 'package:movie_test_app/data/model/tv_series_model.dart';
import 'package:movie_test_app/domain/repositories/data_repository.dart';
import 'package:movie_test_app/utils/exception.dart';
import 'package:movie_test_app/utils/failure.dart';

class DataRepositoryImpl implements DataRepository {
  final DatabaseRemoteDataSource remoteDataSource;

  DataRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final result = await remoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await remoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await remoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() async {
    try {
      final result = await remoteDataSource.getUpcomingMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getAiringTodaySeries() async {
    try {
      final result = await remoteDataSource.getAiringTodaySeries();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getOnTheAirSeries() async {
    try {
      final result = await remoteDataSource.getOnTheAirSeries();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getPopularSeries() async {
    try {
      final result = await remoteDataSource.getPopularSeries();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getTopRatedSeries() async {
    try {
      final result = await remoteDataSource.getTopRatedSeries();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Actor>>> getPopularActor() async {
    try {
      final result = await remoteDataSource.getPopularActor();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(String id) async {
    try {
      final result = await remoteDataSource.getMovieDetail(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, ActorDetail>> getActorDetail(String id) async {
    try {
      final result = await remoteDataSource.getActorDetail(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, SeriesDetail>> getSeriesDetail(String id) async {
    try {
      final result = await remoteDataSource.getSeriesDetail(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getSearchMovies(String query) async {
    try {
      final result = await remoteDataSource.getSearchMovies(query);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, List<Series>>> getSearchSeries(String query) async {
    try {
      final result = await remoteDataSource.getSearchSeries(query);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }
}
