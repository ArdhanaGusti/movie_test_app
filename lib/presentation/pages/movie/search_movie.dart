import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_event.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_state.dart';
import 'package:movie_test_app/presentation/widgets/movie_card.dart';
import 'package:movie_test_app/styles/test_style.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class SearchPageMovie extends StatelessWidget {
  const SearchPageMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Movie'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                context.read<MovieBloc>().add(OnSearchMovie(query));
              },
              decoration: const InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state.searchState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.searchState == StateEnum.loaded) {
                  final result = state.searchMovies;
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = state.searchMovies[index];
                        return MovieCard(movie);
                      },
                      itemCount: result.length,
                    ),
                  );
                } else if (state.searchState == StateEnum.error) {
                  return const Expanded(
                    child: Center(child: Text("Error")),
                  );
                } else {
                  return Expanded(
                    child: Center(
                        child: Text(
                      "Pencarian tidak ditemukan",
                      style: kHeading6,
                    )),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
