import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/domain/usecase/get_airing_today_series.dart';
import 'package:movie_test_app/domain/usecase/get_on_the_air_series.dart';
import 'package:movie_test_app/domain/usecase/get_popular_series.dart';
import 'package:movie_test_app/domain/usecase/get_search_series.dart';
import 'package:movie_test_app/domain/usecase/get_series_detail.dart';
import 'package:movie_test_app/domain/usecase/get_top_rated_series.dart';
import 'package:movie_test_app/presentation/bloc/series/series_event.dart';
import 'package:movie_test_app/presentation/bloc/series/series_state.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final GetAiringTodaySeries getAiringTodaySeries;
  final GetPopularSeries getPopularSeries;
  final GetTopRatedSeries getTopRatedSeries;
  final GetOnTheAirSeries getOnTheAirSeries;
  final GetSeriesDetail getSeriesDetail;
  final GetSearchSeries getSearchSeries;
  SeriesBloc(
    this.getAiringTodaySeries,
    this.getPopularSeries,
    this.getTopRatedSeries,
    this.getOnTheAirSeries,
    this.getSeriesDetail,
    this.getSearchSeries,
  ) : super(SeriesState.initial()) {
    on<OnGetAiringTodaySeries>(
      (event, emit) async {
        emit(state.copyWith(airingTodaySeriesState: StateEnum.loading));
        final result = await getAiringTodaySeries.execute();
        result.fold((failure) {
          emit(state.copyWith(
            airingTodaySeriesState: StateEnum.error,
            airingTodayMessage: failure.message,
          ));
        }, (series) {
          emit(state.copyWith(
            airingTodaySeries: series,
            airingTodaySeriesState: StateEnum.loaded,
            airingTodayMessage: '',
          ));
        });
      },
    );
    on<OnGetPopularSeries>(
      (event, emit) async {
        emit(state.copyWith(popularSeriesState: StateEnum.loading));
        final result = await getPopularSeries.execute();
        result.fold((failure) {
          emit(state.copyWith(
            popularSeriesState: StateEnum.error,
            popularMessage: failure.message,
          ));
        }, (series) {
          emit(state.copyWith(
            popularSeries: series,
            popularSeriesState: StateEnum.loaded,
            popularMessage: '',
          ));
        });
      },
    );
    on<OnGetTopRatedSeries>(
      (event, emit) async {
        emit(state.copyWith(topRatedSeriesState: StateEnum.loading));
        final result = await getTopRatedSeries.execute();
        result.fold((failure) {
          emit(state.copyWith(
            topRatedSeriesState: StateEnum.error,
            topRatedMessage: failure.message,
          ));
        }, (series) {
          emit(state.copyWith(
            topRatedSeries: series,
            topRatedSeriesState: StateEnum.loaded,
            topRatedMessage: '',
          ));
        });
      },
    );
    on<OnGetOnTheAirSeries>(
      (event, emit) async {
        emit(state.copyWith(onTheAirSeriesState: StateEnum.loading));
        final result = await getOnTheAirSeries.execute();
        result.fold((failure) {
          emit(state.copyWith(
            onTheAirSeriesState: StateEnum.error,
            onTheAirMessage: failure.message,
          ));
        }, (series) {
          emit(state.copyWith(
            onTheAirSeries: series,
            onTheAirSeriesState: StateEnum.loaded,
            onTheAirMessage: '',
          ));
        });
      },
    );
    on<OnGetSeriesDetail>(
      (event, emit) async {
        emit(state.copyWith(seriesDetailState: StateEnum.loading));
        final result = await getSeriesDetail.execute(event.id);
        result.fold((failure) {
          emit(state.copyWith(
            seriesDetailState: StateEnum.error,
            detailMessage: failure.message,
          ));
        }, (serie) {
          emit(state.copyWith(
            seriesDetail: serie,
            seriesDetailState: StateEnum.loaded,
            detailMessage: '',
          ));
        });
      },
    );
    on<OnSearchSeries>(
      (event, emit) async {
        emit(state.copyWith(searchState: StateEnum.loading));
        final result = await getSearchSeries.execute(event.query);
        result.fold((failure) {
          emit(state.copyWith(
            searchState: StateEnum.error,
            detailMessage: failure.message,
          ));
        }, (serie) {
          emit(state.copyWith(
            searchSeries: serie,
            searchState: StateEnum.loaded,
            detailMessage: '',
          ));
        });
      },
    );
  }
}
