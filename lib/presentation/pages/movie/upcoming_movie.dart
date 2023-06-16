import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_event.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_state.dart';
import 'package:movie_test_app/presentation/widgets/movie_card.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class UpcomingMovie extends StatefulWidget {
  const UpcomingMovie({super.key});

  @override
  State<UpcomingMovie> createState() => _UpcomingMovieState();
}

class _UpcomingMovieState extends State<UpcomingMovie> {
  @override
  void initState() {
    context.read<MovieBloc>().add(const OnGetUpcomingMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state.upcomingMovieState == StateEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.upcomingMovieState == StateEnum.loaded) {
              final result = state.upcomingMovies;
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return MovieCard(movie);
                },
                itemCount: result.length,
              );
            } else if (state.upcomingMovieState == StateEnum.error) {
              final result = state.upcomingMessage;
              return Text(result);
            } else if (state.upcomingMovieState == StateEnum.empty) {
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
