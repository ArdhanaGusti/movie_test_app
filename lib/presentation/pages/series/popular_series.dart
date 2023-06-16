import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_event.dart';
import 'package:movie_test_app/presentation/bloc/series/series_state.dart';
import 'package:movie_test_app/presentation/widgets/series_card.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class PopularSeries extends StatefulWidget {
  const PopularSeries({super.key});

  @override
  State<PopularSeries> createState() => _PopularSeriesState();
}

class _PopularSeriesState extends State<PopularSeries> {
  @override
  void initState() {
    context.read<SeriesBloc>().add(const OnGetPopularSeries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SeriesBloc, SeriesState>(
          builder: (context, state) {
            if (state.popularSeriesState == StateEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.popularSeriesState == StateEnum.loaded) {
              final result = state.popularSeries;
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return SeriesCard(movie);
                },
                itemCount: result.length,
              );
            } else if (state.popularSeriesState == StateEnum.error) {
              final result = state.popularMessage;
              return Text(result);
            } else if (state.popularSeriesState == StateEnum.empty) {
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
