import 'package:equatable/equatable.dart';

import 'package:movie_test_app/data/model/movie_model.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  final List<Movie> searchMovies;
  final MovieDetail? movieDetail;
  final StateEnum nowPlayingMovieState;
  final StateEnum popularMovieState;
  final StateEnum topRatedMovieState;
  final StateEnum upcomingMovieState;
  final StateEnum movieDetailState;
  final StateEnum searchState;
  final String nowPlayingMessage;
  final String popularMessage;
  final String topRatedMessage;
  final String upcomingMessage;
  final String detailMessage;
  final String searchMessage;
  const MovieState({
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
    required this.movieDetail,
    required this.popularMovieState,
    required this.topRatedMovieState,
    required this.upcomingMovieState,
    required this.movieDetailState,
    required this.popularMessage,
    required this.topRatedMessage,
    required this.upcomingMessage,
    required this.detailMessage,
    required this.nowPlayingMovies,
    required this.nowPlayingMovieState,
    required this.nowPlayingMessage,
    required this.searchMessage,
    required this.searchMovies,
    required this.searchState,
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
    List<Movie>? searchMovies,
    MovieDetail? movieDetail,
    StateEnum? nowPlayingMovieState,
    StateEnum? popularMovieState,
    StateEnum? topRatedMovieState,
    StateEnum? upcomingMovieState,
    StateEnum? movieDetailState,
    StateEnum? searchState,
    String? nowPlayingMessage,
    String? popularMessage,
    String? topRatedMessage,
    String? upcomingMessage,
    String? detailMessage,
    String? searchMessage,
  }) {
    return MovieState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      upcomingMovies: upcomingMovies ?? this.upcomingMovies,
      searchMovies: searchMovies ?? this.searchMovies,
      movieDetail: movieDetail ?? this.movieDetail,
      nowPlayingMovieState: nowPlayingMovieState ?? this.nowPlayingMovieState,
      popularMovieState: popularMovieState ?? this.popularMovieState,
      topRatedMovieState: topRatedMovieState ?? this.topRatedMovieState,
      upcomingMovieState: upcomingMovieState ?? this.upcomingMovieState,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      searchState: searchState ?? this.searchState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      upcomingMessage: upcomingMessage ?? this.upcomingMessage,
      detailMessage: detailMessage ?? this.detailMessage,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  factory MovieState.initial() {
    return const MovieState(
      nowPlayingMovies: [],
      nowPlayingMovieState: StateEnum.empty,
      nowPlayingMessage: '',
      popularMessage: '',
      popularMovieState: StateEnum.empty,
      popularMovies: [],
      topRatedMessage: '',
      topRatedMovieState: StateEnum.empty,
      topRatedMovies: [],
      upcomingMessage: '',
      upcomingMovies: [],
      upcomingMovieState: StateEnum.empty,
      detailMessage: '',
      movieDetail: null,
      movieDetailState: StateEnum.empty,
      searchMessage: '',
      searchMovies: [],
      searchState: StateEnum.empty,
    );
  }

  @override
  List<Object?> get props {
    return [
      nowPlayingMovies,
      popularMovies,
      topRatedMovies,
      upcomingMovies,
      searchMovies,
      movieDetail,
      nowPlayingMovieState,
      popularMovieState,
      topRatedMovieState,
      upcomingMovieState,
      movieDetailState,
      searchState,
      nowPlayingMessage,
      popularMessage,
      topRatedMessage,
      upcomingMessage,
      detailMessage,
      searchMessage,
    ];
  }
}
