import 'package:dartz/dartz.dart';
import 'package:movie_test_app/data/model/actor_model.dart';
import 'package:movie_test_app/domain/repositories/data_repository.dart';
import 'package:movie_test_app/utils/failure.dart';

class GetPopularActor {
  final DataRepository repository;

  GetPopularActor(this.repository);

  Future<Either<Failure, List<Actor>>> execute() {
    return repository.getPopularActor();
  }
}
