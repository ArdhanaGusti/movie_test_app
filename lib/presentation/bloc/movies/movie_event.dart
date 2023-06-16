import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class OnGetNowPlayingMovies extends MovieEvent {
  const OnGetNowPlayingMovies();

  @override
  List<Object> get props => [];
}

class OnGetPopularMovies extends MovieEvent {
  const OnGetPopularMovies();

  @override
  List<Object> get props => [];
}

class OnGetTopRatedMovies extends MovieEvent {
  const OnGetTopRatedMovies();

  @override
  List<Object> get props => [];
}

class OnGetUpcomingMovies extends MovieEvent {
  const OnGetUpcomingMovies();

  @override
  List<Object> get props => [];
}

class OnGetMovieDetail extends MovieEvent {
  final String id;
  const OnGetMovieDetail(this.id);

  @override
  List<Object> get props => [id];
}

class OnSearchMovie extends MovieEvent {
  final String query;
  const OnSearchMovie(this.query);

  @override
  List<Object> get props => [query];
}
