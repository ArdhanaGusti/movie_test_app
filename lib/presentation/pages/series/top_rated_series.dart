import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_event.dart';
import 'package:movie_test_app/presentation/bloc/series/series_state.dart';
import 'package:movie_test_app/presentation/widgets/series_card.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class TopRatedSeries extends StatefulWidget {
  const TopRatedSeries({super.key});

  @override
  State<TopRatedSeries> createState() => _TopRatedSeriesState();
}

class _TopRatedSeriesState extends State<TopRatedSeries> {
  @override
  void initState() {
    context.read<SeriesBloc>().add(const OnGetTopRatedSeries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SeriesBloc, SeriesState>(
          builder: (context, state) {
            if (state.topRatedSeriesState == StateEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.topRatedSeriesState == StateEnum.loaded) {
              final result = state.topRatedSeries;
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return SeriesCard(movie);
                },
                itemCount: result.length,
              );
            } else if (state.topRatedSeriesState == StateEnum.error) {
              final result = state.topRatedMessage;
              return Text(result);
            } else if (state.topRatedSeriesState == StateEnum.empty) {
              return const Center(child: Text("Data top rated kosong"));
            } else {
              return const Text('Failed');
            }
          },
        ),
      ),
    );
  }
}
