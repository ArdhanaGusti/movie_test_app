import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_event.dart';
import 'package:movie_test_app/presentation/bloc/series/series_state.dart';
import 'package:movie_test_app/presentation/pages/series/on_the_air_series.dart';
import 'package:movie_test_app/presentation/pages/series/popular_series.dart';
import 'package:movie_test_app/presentation/pages/series/top_rated_series.dart';
import 'package:movie_test_app/presentation/widgets/series_list.dart';
import 'package:movie_test_app/styles/test_style.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  void initState() {
    context.read<SeriesBloc>().add(const OnGetAiringTodaySeries());
    context.read<SeriesBloc>().add(const OnGetTopRatedSeries());
    context.read<SeriesBloc>().add(const OnGetPopularSeries());
    context.read<SeriesBloc>().add(const OnGetOnTheAirSeries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Airing Today',
              style: kHeading6,
            ),
            BlocBuilder<SeriesBloc, SeriesState>(
              builder: (context, state) {
                if (state.airingTodaySeriesState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.airingTodaySeriesState == StateEnum.loaded) {
                  final result = state.airingTodaySeries;
                  return SeriesList(
                    movies: result,
                  );
                } else if (state.airingTodaySeriesState == StateEnum.error) {
                  final result = state.airingTodayMessage;
                  return Text(result);
                } else {
                  return const Text('Failed');
                }
              },
            ),
            _buildSubHeading(
              title: "Popular",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const PopularSeries();
                  },
                ));
              },
            ),
            BlocBuilder<SeriesBloc, SeriesState>(
              builder: (context, state) {
                if (state.popularSeriesState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.popularSeriesState == StateEnum.loaded) {
                  final result = state.popularSeries;
                  return SeriesList(
                    movies: result,
                  );
                } else if (state.popularSeriesState == StateEnum.error) {
                  final result = state.popularMessage;
                  return Text(result);
                } else {
                  return const Text('Failed');
                }
              },
            ),
            _buildSubHeading(
              title: "Top Rated",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const TopRatedSeries();
                  },
                ));
              },
            ),
            BlocBuilder<SeriesBloc, SeriesState>(
              builder: (context, state) {
                if (state.topRatedSeriesState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.topRatedSeriesState == StateEnum.loaded) {
                  final result = state.topRatedSeries;
                  return SeriesList(
                    movies: result,
                  );
                } else if (state.topRatedSeriesState == StateEnum.error) {
                  final result = state.topRatedMessage;
                  return Text(result);
                } else {
                  return const Text('Failed');
                }
              },
            ),
            _buildSubHeading(
              title: "On The Air",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const OnTheAirSeries();
                  },
                ));
              },
            ),
            BlocBuilder<SeriesBloc, SeriesState>(
              builder: (context, state) {
                if (state.onTheAirSeriesState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.onTheAirSeriesState == StateEnum.loaded) {
                  final result = state.onTheAirSeries;
                  return SeriesList(
                    movies: result,
                  );
                } else if (state.onTheAirSeriesState == StateEnum.error) {
                  final result = state.onTheAirMessage;
                  return Text(result);
                } else {
                  return const Text('Failed');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text('See More'),
                const Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
