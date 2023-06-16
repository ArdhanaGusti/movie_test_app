import 'package:movie_test_app/domain/usecase/get_movie_detail.dart';
import 'package:movie_test_app/domain/usecase/get_now_playing_movies.dart';
import 'package:movie_test_app/domain/usecase/get_popular_movies.dart';
import 'package:movie_test_app/domain/usecase/get_search_movies.dart';
import 'package:movie_test_app/domain/usecase/get_top_rated_movies.dart';
import 'package:movie_test_app/domain/usecase/get_upcoming_movies.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_event.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;
  final GetUpcomingMovies getUpcomingMovies;
  final GetMovieDetail getMovieDetail;
  final GetSearchMovies getSearchMovies;
  MovieBloc(
    this.getNowPlayingMovies,
    this.getPopularMovies,
    this.getTopRatedMovies,
    this.getUpcomingMovies,
    this.getMovieDetail,
    this.getSearchMovies,
  ) : super(MovieState.initial()) {
    on<OnGetNowPlayingMovies>(
      (event, emit) async {
        emit(state.copyWith(nowPlayingMovieState: StateEnum.loading));
        final result = await getNowPlayingMovies.execute();
        result.fold((failure) {
          emit(state.copyWith(
            nowPlayingMovieState: StateEnum.error,
            nowPlayingMessage: failure.message,
          ));
        }, (movies) {
          emit(state.copyWith(
            nowPlayingMovies: movies,
            nowPlayingMovieState: StateEnum.loaded,
            nowPlayingMessage: '',
          ));
        });
      },
    );
    on<OnGetPopularMovies>(
      (event, emit) async {
        emit(state.copyWith(popularMovieState: StateEnum.loading));
        final result = await getPopularMovies.execute();
        result.fold((failure) {
          emit(state.copyWith(
            popularMovieState: StateEnum.error,
            popularMessage: failure.message,
          ));
        }, (movies) {
          emit(state.copyWith(
            popularMovies: movies,
            popularMovieState: StateEnum.loaded,
            popularMessage: '',
          ));
        });
      },
    );
    on<OnGetTopRatedMovies>(
      (event, emit) async {
        emit(state.copyWith(topRatedMovieState: StateEnum.loading));
        final result = await getTopRatedMovies.execute();
        result.fold((failure) {
          emit(state.copyWith(
            topRatedMovieState: StateEnum.error,
            topRatedMessage: failure.message,
          ));
        }, (movies) {
          emit(state.copyWith(
            topRatedMovies: movies,
            topRatedMovieState: StateEnum.loaded,
            topRatedMessage: '',
          ));
        });
      },
    );
    on<OnGetUpcomingMovies>(
      (event, emit) async {
        emit(state.copyWith(upcomingMovieState: StateEnum.loading));
        final result = await getUpcomingMovies.execute();
        result.fold((failure) {
          emit(state.copyWith(
            upcomingMovieState: StateEnum.error,
            upcomingMessage: failure.message,
          ));
        }, (movies) {
          emit(state.copyWith(
            upcomingMovies: movies,
            upcomingMovieState: StateEnum.loaded,
            upcomingMessage: '',
          ));
        });
      },
    );
    on<OnGetMovieDetail>(
      (event, emit) async {
        emit(state.copyWith(movieDetailState: StateEnum.loading));
        final result = await getMovieDetail.execute(event.id);
        result.fold((failure) {
          emit(state.copyWith(
            movieDetailState: StateEnum.error,
            detailMessage: failure.message,
          ));
        }, (movie) {
          emit(state.copyWith(
            movieDetail: movie,
            movieDetailState: StateEnum.loaded,
            detailMessage: '',
          ));
        });
      },
    );
    on<OnSearchMovie>(
      (event, emit) async {
        emit(state.copyWith(searchState: StateEnum.loading));
        final result = await getSearchMovies.execute(event.query);
        result.fold((failure) {
          emit(state.copyWith(
            searchState: StateEnum.error,
            searchMessage: failure.message,
          ));
        }, (movie) {
          emit(state.copyWith(
            searchMovies: movie,
            searchState: StateEnum.loaded,
            searchMessage: '',
          ));
        });
      },
    );
  }
}
