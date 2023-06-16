import 'package:dartz/dartz.dart';
import 'package:movie_test_app/data/model/tv_series_model.dart';
import 'package:movie_test_app/domain/repositories/data_repository.dart';
import 'package:movie_test_app/utils/failure.dart';

class GetSearchSeries {
  final DataRepository repository;

  GetSearchSeries(this.repository);

  Future<Either<Failure, List<Series>>> execute(String query) {
    return repository.getSearchSeries(query);
  }
}
