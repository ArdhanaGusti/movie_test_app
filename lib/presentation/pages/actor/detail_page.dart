import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/data/model/actor_model.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_bloc.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_event.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_state.dart';
import 'package:movie_test_app/styles/colors.dart';
import 'package:movie_test_app/styles/test_style.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class ActorDetailPage extends StatefulWidget {
  final int id;
  const ActorDetailPage({super.key, required this.id});

  @override
  State<ActorDetailPage> createState() => _ActorDetailPage();
}

class _ActorDetailPage extends State<ActorDetailPage> {
  @override
  void initState() {
    context.read<ActorBloc>().add(OnGetActorDetail(widget.id.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ActorBloc, ActorState>(
        builder: (context, state) {
          if (state.detailActorState == StateEnum.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.detailActorState == StateEnum.loaded) {
            final movie = state.detailActor!;
            return SafeArea(
              child: DetailContentAct(
                movie,
                // state.movieRecommendations,
                // state.isAddedToWatchlist,
              ),
            );
          } else if (state.detailActorState == StateEnum.error) {
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

class DetailContentAct extends StatelessWidget {
  final ActorDetail movie;
  // final List<Movie> recommendations;
  // final bool isAddedWatchlist;

  const DetailContentAct(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${movie.profilePath}',
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
                              movie.name,
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
                            Text(
                              'Birthdate',
                              style: kHeading6,
                            ),
                            Text(
                              movie.birthday.toString(),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Biography',
                              style: kHeading6,
                            ),
                            Text(
                              movie.biography,
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
