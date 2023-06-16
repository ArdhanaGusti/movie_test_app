import 'package:equatable/equatable.dart';

import 'package:movie_test_app/data/model/actor_model.dart';
import 'package:movie_test_app/utils/state_enum.dart';

class ActorState extends Equatable {
  final List<Actor> popularActor;
  final StateEnum popularActorState;
  final String popularMessage;
  final ActorDetail? detailActor;
  final StateEnum detailActorState;
  final String detailMessage;
  const ActorState({
    required this.popularActor,
    required this.popularActorState,
    required this.popularMessage,
    required this.detailActor,
    required this.detailActorState,
    required this.detailMessage,
  });

  ActorState copyWith({
    List<Actor>? popularActor,
    StateEnum? popularActorState,
    String? popularMessage,
    ActorDetail? detailActor,
    StateEnum? detailActorState,
    String? detailMessage,
  }) {
    return ActorState(
      popularActor: popularActor ?? this.popularActor,
      popularActorState: popularActorState ?? this.popularActorState,
      popularMessage: popularMessage ?? this.popularMessage,
      detailActor: detailActor ?? this.detailActor,
      detailActorState: detailActorState ?? this.detailActorState,
      detailMessage: detailMessage ?? this.detailMessage,
    );
  }

  factory ActorState.initial() {
    return const ActorState(
      popularActor: [],
      popularActorState: StateEnum.empty,
      popularMessage: '',
      detailActor: null,
      detailActorState: StateEnum.empty,
      detailMessage: '',
    );
  }

  @override
  List<Object?> get props {
    return [
      popularActor,
      popularActorState,
      popularMessage,
      detailActor,
      detailActorState,
      detailMessage,
    ];
  }
}
