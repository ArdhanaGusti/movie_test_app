import 'package:equatable/equatable.dart';

abstract class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class OnGetAiringTodaySeries extends SeriesEvent {
  const OnGetAiringTodaySeries();

  @override
  List<Object> get props => [];
}

class OnGetPopularSeries extends SeriesEvent {
  const OnGetPopularSeries();

  @override
  List<Object> get props => [];
}

class OnGetTopRatedSeries extends SeriesEvent {
  const OnGetTopRatedSeries();

  @override
  List<Object> get props => [];
}

class OnGetOnTheAirSeries extends SeriesEvent {
  const OnGetOnTheAirSeries();

  @override
  List<Object> get props => [];
}

class OnGetSeriesDetail extends SeriesEvent {
  final String id;
  const OnGetSeriesDetail(this.id);

  @override
  List<Object> get props => [id];
}

class OnSearchSeries extends SeriesEvent {
  final String query;
  const OnSearchSeries(this.query);

  @override
  List<Object> get props => [query];
}
