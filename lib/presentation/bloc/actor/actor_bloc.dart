import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_test_app/domain/usecase/get_actor_detail.dart';
import 'package:movie_test_app/domain/usecase/get_popular_actor.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_event.dart';
import 'package:movie_test_app/presentation/bloc/actor/actor_state.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class ActorBloc extends Bloc<ActorEvent, ActorState> {
  final GetPopularActor getPopularActor;
  final GetActorDetail getActorDetail;
  ActorBloc(
    this.getPopularActor,
    this.getActorDetail,
  ) : super(ActorState.initial()) {
    on<OnGetPopularActor>(
      (event, emit) async {
        emit(state.copyWith(popularActorState: StateEnum.loading));
        final result = await getPopularActor.execute();
        result.fold((failure) {
          emit(state.copyWith(
            popularActorState: StateEnum.error,
            popularMessage: failure.message,
          ));
        }, (actors) {
          emit(state.copyWith(
            popularActor: actors,
            popularActorState: StateEnum.loaded,
            popularMessage: '',
          ));
        });
      },
    );
    on<OnGetActorDetail>(
      (event, emit) async {
        emit(state.copyWith(detailActorState: StateEnum.loading));
        final result = await getActorDetail.execute(event.id);
        result.fold((failure) {
          emit(state.copyWith(
            detailActorState: StateEnum.error,
            detailMessage: failure.message,
          ));
        }, (actor) {
          emit(state.copyWith(
            detailActor: actor,
            detailActorState: StateEnum.loaded,
            detailMessage: '',
          ));
        });
      },
    );
  }
}
