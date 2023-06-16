import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_bloc.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_event.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_state.dart';
import 'package:movie_test_app/presentation/widgets/actor_list.dart';
import 'package:movie_test_app/styles/test_style.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class ActorPage extends StatefulWidget {
  const ActorPage({super.key});

  @override
  State<ActorPage> createState() => _ActorPageState();
}

class _ActorPageState extends State<ActorPage> {
  @override
  void initState() {
    context.read<ActorBloc>().add(const OnGetPopularActor());
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
              'Popular',
              style: kHeading6,
            ),
            BlocBuilder<ActorBloc, ActorState>(
              builder: (context, state) {
                if (state.popularActorState == StateEnum.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.popularActorState == StateEnum.loaded) {
                  final result = state.popularActor;
                  return ActorList(
                    actors: result,
                  );
                } else if (state.popularActorState == StateEnum.error) {
                  final result = state.popularMessage;
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
}
