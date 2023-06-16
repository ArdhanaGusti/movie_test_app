import 'package:dartz/dartz.dart';
import 'package:movie_test_app/data/model/movie_model.dart';
import 'package:movie_test_app/domain/repositories/data_repository.dart';
import 'package:movie_test_app/utils/failure.dart';

class GetSearchMovies {
  final DataRepository repository;

  GetSearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> execute(String query) {
    return repository.getSearchMovies(query);
  }
}
