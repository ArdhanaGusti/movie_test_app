import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_bloc.dart';
import 'package:movie_test_app/presentation/bloc/series/series_event.dart';
import 'package:movie_test_app/presentation/bloc/series/series_state.dart';
import 'package:movie_test_app/presentation/widgets/series_card.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class OnTheAirSeries extends StatefulWidget {
  const OnTheAirSeries({super.key});

  @override
  State<OnTheAirSeries> createState() => _OnTheAirSeriesState();
}

class _OnTheAirSeriesState extends State<OnTheAirSeries> {
  @override
  void initState() {
    context.read<SeriesBloc>().add(const OnGetOnTheAirSeries());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On The Air Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<SeriesBloc, SeriesState>(
          builder: (context, state) {
            if (state.onTheAirSeriesState == StateEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.onTheAirSeriesState == StateEnum.loaded) {
              final result = state.onTheAirSeries;
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return SeriesCard(movie);
                },
                itemCount: result.length,
              );
            } else if (state.onTheAirSeriesState == StateEnum.error) {
              final result = state.onTheAirMessage;
              return Text(result);
            } else if (state.onTheAirSeriesState == StateEnum.empty) {
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
