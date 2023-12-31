import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_test_app/data/model/movie_model.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_bloc.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_event.dart';
import 'package:movie_test_app/presentation/bloc/movies/movie_state.dart';
import 'package:movie_test_app/styles/colors.dart';
import 'package:movie_test_app/styles/test_style.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class MovieDetailPage extends StatefulWidget {
  final int id;
  const MovieDetailPage({super.key, required this.id});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPage();
}

class _MovieDetailPage extends State<MovieDetailPage> {
  @override
  void initState() {
    context.read<MovieBloc>().add(OnGetMovieDetail(widget.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state.movieDetailState == StateEnum.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.movieDetailState == StateEnum.loaded) {
            final movie = state.movieDetail!;
            return SafeArea(
              child: DetailContentMov(
                movie,
                // state.movieRecommendations,
                // state.isAddedToWatchlist,
              ),
            );
          } else if (state.movieDetailState == StateEnum.error) {
            final result = state.detailMessage;
            return Center(child: Text(result));
          } else {
            return const Text('Failed');
          }
        },
      ),
    );
  }
}

class DetailContentMov extends StatelessWidget {
  final MovieDetail movie;
  // final List<Movie> recommendations;
  // final bool isAddedWatchlist;

  const DetailContentMov(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            // Text(
                            //   _showGenres(movie.genres),
                            // ),
                            // Text(
                            //   _showDuration(movie.runtime),
                            // ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movie.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movie.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movie.overview,
                            ),
                            const SizedBox(height: 16),
                            // Text(
                            //   'Recommendations',
                            //   style: kHeading6,
                            // ),
                            // SizedBox(
                            //   height: 150,
                            //   child: ListView.builder(
                            //     scrollDirection: Axis.horizontal,
                            //     itemBuilder: (context, index) {
                            //       final movie = recommendations[index];
                            //       return Padding(
                            //         padding: const EdgeInsets.all(4.0),
                            //         child: InkWell(
                            //           onTap: () {
                            //             Navigator.pushReplacementNamed(
                            //               context,
                            //               MovieDetailPage.ROUTE_NAME,
                            //               arguments: movie.id,
                            //             );
                            //           },
                            //           child: ClipRRect(
                            //             borderRadius: const BorderRadius.all(
                            //               Radius.circular(8),
                            //             ),
                            //             child: CachedNetworkImage(
                            //               imageUrl:
                            //                   'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            //               placeholder: (context, url) =>
                            //                   const Center(
                            //                 child: CircularProgressIndicator(),
                            //               ),
                            //               errorWidget: (context, url, error) =>
                            //                   const Icon(Icons.error),
                            //             ),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //     itemCount: recommendations.length,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  // String _showGenres(List<Genre> genres) {
  //   String result = '';
  //   for (var genre in genres) {
  //     result += genre.name + ', ';
  //   }

  //   if (result.isEmpty) {
  //     return result;
  //   }

  //   return result.substring(0, result.length - 2);
  // }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}
