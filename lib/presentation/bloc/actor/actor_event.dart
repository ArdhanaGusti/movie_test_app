import 'package:equatable/equatable.dart';

abstract class ActorEvent extends Equatable {
  const ActorEvent();

  @override
  List<Object> get props => [];
}

class OnGetPopularActor extends ActorEvent {
  const OnGetPopularActor();

  @override
  List<Object> get props => [];
}

class OnGetActorDetail extends ActorEvent {
  final String id;
  const OnGetActorDetail(this.id);

  @override
  List<Object> get props => [id];
}
