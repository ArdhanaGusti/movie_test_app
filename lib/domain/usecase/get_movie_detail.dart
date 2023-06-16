import 'package:dartz/dartz.dart';
import 'package:movie_test_app/data/model/movie_model.dart';
import 'package:movie_test_app/domain/repositories/data_repository.dart';
import 'package:movie_test_app/utils/failure.dart';

class GetMovieDetail {
  final DataRepository repository;

  GetMovieDetail(this.repository);

  Future<Either<Failure, MovieDetail>> execute(String id) {
    return repository.getMovieDetail(id);
  }
}
