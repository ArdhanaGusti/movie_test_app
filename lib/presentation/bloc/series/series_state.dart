import 'package:equatable/equatable.dart';

import 'package:movie_test_app/data/model/tv_series_model.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class SeriesState extends Equatable {
  final List<Series> airingTodaySeries;
  final List<Series> popularSeries;
  final List<Series> topRatedSeries;
  final List<Series> onTheAirSeries;
  final StateEnum airingTodaySeriesState;
  final StateEnum popularSeriesState;
  final StateEnum topRatedSeriesState;
  final StateEnum onTheAirSeriesState;
  final String airingTodayMessage;
  final String popularMessage;
  final String topRatedMessage;
  final String onTheAirMessage;
  final SeriesDetail? seriesDetail;
  final StateEnum seriesDetailState;
  final String detailMessage;
  final List<Series> searchSeries;
  final StateEnum searchState;
  final String searchMessage;
  const SeriesState({
    required this.airingTodaySeries,
    required this.popularSeries,
    required this.topRatedSeries,
    required this.onTheAirSeries,
    required this.airingTodaySeriesState,
    required this.popularSeriesState,
    required this.topRatedSeriesState,
    required this.onTheAirSeriesState,
    required this.airingTodayMessage,
    required this.popularMessage,
    required this.topRatedMessage,
    required this.onTheAirMessage,
    required this.detailMessage,
    required this.seriesDetail,
    required this.seriesDetailState,
    required this.searchMessage,
    required this.searchSeries,
    required this.searchState,
  });

  SeriesState copyWith({
    List<Series>? airingTodaySeries,
    List<Series>? popularSeries,
    List<Series>? topRatedSeries,
    List<Series>? onTheAirSeries,
    StateEnum? airingTodaySeriesState,
    StateEnum? popularSeriesState,
    StateEnum? topRatedSeriesState,
    StateEnum? onTheAirSeriesState,
    String? airingTodayMessage,
    String? popularMessage,
    String? topRatedMessage,
    String? onTheAirMessage,
    SeriesDetail? seriesDetail,
    StateEnum? seriesDetailState,
    String? detailMessage,
    List<Series>? searchSeries,
    StateEnum? searchState,
    String? searchMessage,
  }) {
    return SeriesState(
      airingTodaySeries: airingTodaySeries ?? this.airingTodaySeries,
      popularSeries: popularSeries ?? this.popularSeries,
      topRatedSeries: topRatedSeries ?? this.topRatedSeries,
      onTheAirSeries: onTheAirSeries ?? this.onTheAirSeries,
      airingTodaySeriesState:
          airingTodaySeriesState ?? this.airingTodaySeriesState,
      popularSeriesState: popularSeriesState ?? this.popularSeriesState,
      topRatedSeriesState: topRatedSeriesState ?? this.topRatedSeriesState,
      onTheAirSeriesState: onTheAirSeriesState ?? this.onTheAirSeriesState,
      airingTodayMessage: airingTodayMessage ?? this.airingTodayMessage,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      onTheAirMessage: onTheAirMessage ?? this.onTheAirMessage,
      seriesDetail: seriesDetail ?? this.seriesDetail,
      seriesDetailState: seriesDetailState ?? this.seriesDetailState,
      detailMessage: detailMessage ?? this.detailMessage,
      searchSeries: searchSeries ?? this.searchSeries,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  factory SeriesState.initial() {
    return const SeriesState(
      airingTodayMessage: '',
      airingTodaySeries: [],
      airingTodaySeriesState: StateEnum.empty,
      onTheAirMessage: '',
      onTheAirSeries: [],
      onTheAirSeriesState: StateEnum.empty,
      popularMessage: '',
      popularSeries: [],
      popularSeriesState: StateEnum.empty,
      topRatedMessage: '',
      topRatedSeries: [],
      topRatedSeriesState: StateEnum.empty,
      detailMessage: '',
      seriesDetail: null,
      seriesDetailState: StateEnum.empty,
      searchMessage: '',
      searchSeries: [],
      searchState: StateEnum.empty,
    );
  }

  @override
  List<Object?> get props {
    return [
      airingTodaySeries,
      popularSeries,
      topRatedSeries,
      onTheAirSeries,
      airingTodaySeriesState,
      popularSeriesState,
      topRatedSeriesState,
      onTheAirSeriesState,
      airingTodayMessage,
      popularMessage,
      topRatedMessage,
      onTheAirMessage,
      seriesDetail,
      seriesDetailState,
      detailMessage,
      searchSeries,
      searchState,
      searchMessage,
    ];
  }
}
