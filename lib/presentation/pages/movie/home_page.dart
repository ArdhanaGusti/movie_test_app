import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_event.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_state.dart';
import 'package:movie_test_app/presentation/pages/movie/popular_movie.dart';
import 'package:movie_test_app/presentation/pages/movie/top_rated_movie.dart';
import 'package:movie_test_app/presentation/pages/movie/upcoming_movie.dart';
import 'package:movie_test_app/presentation/widgets/movie_list.dart';
import 'package:movie_test_app/styles/test_style.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  void initState() {
    context.read<MovieBloc>().add(const OnGetNowPlayingMovies());
    context.read<MovieBloc>().add(const OnGetTopRatedMovies());
    context.read<MovieBloc>().add(const OnGetPopularMovies());
    context.read<MovieBloc>().add(const OnGetUpcomingMovies());
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
              'Now Playing',
              style: kHeading6,
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state.nowPlayingMovieState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.nowPlayingMovieState == StateEnum.loaded) {
                  final result = state.nowPlayingMovies;
                  return MovieList(
                    movies: result,
                  );
                } else if (state.nowPlayingMovieState == StateEnum.error) {
                  final result = state.nowPlayingMessage;
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
                    return const PopularMovie();
                  },
                ));
              },
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state.popularMovieState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.popularMovieState == StateEnum.loaded) {
                  final result = state.popularMovies;
                  return MovieList(
                    movies: result,
                  );
                } else if (state.popularMovieState == StateEnum.error) {
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
                    return const TopRatedMovie();
                  },
                ));
              },
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state.topRatedMovieState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.topRatedMovieState == StateEnum.loaded) {
                  final result = state.topRatedMovies;
                  return MovieList(
                    movies: result,
                  );
                } else if (state.topRatedMovieState == StateEnum.error) {
                  final result = state.topRatedMessage;
                  return Text(result);
                } else {
                  return const Text('Failed');
                }
              },
            ),
            _buildSubHeading(
              title: "Upcoming",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const UpcomingMovie();
                  },
                ));
              },
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state.upcomingMovieState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.upcomingMovieState == StateEnum.loaded) {
                  final result = state.upcomingMovies;
                  return MovieList(
                    movies: result,
                  );
                } else if (state.upcomingMovieState == StateEnum.error) {
                  final result = state.upcomingMessage;
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
