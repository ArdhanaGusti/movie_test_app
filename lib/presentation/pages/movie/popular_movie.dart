import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_event.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_state.dart';
import 'package:movie_test_app/presentation/widgets/movie_card.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class PopularMovie extends StatefulWidget {
  const PopularMovie({super.key});

  @override
  State<PopularMovie> createState() => _PopularMovieState();
}

class _PopularMovieState extends State<PopularMovie> {
  @override
  void initState() {
    context.read<MovieBloc>().add(const OnGetPopularMovies());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state.popularMovieState == StateEnum.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.popularMovieState == StateEnum.loaded) {
              final result = state.popularMovies;
              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return MovieCard(movie);
                },
                itemCount: result.length,
              );
            } else if (state.popularMovieState == StateEnum.error) {
              final result = state.popularMessage;
              return Text(result);
            } else if (state.topRatedMovieState == StateEnum.empty) {
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
