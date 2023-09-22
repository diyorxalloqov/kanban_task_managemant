part of 'boards_bloc.dart';

@immutable
abstract class BoardsEvent extends Equatable {
  const BoardsEvent();
}

final class BoardsCreateEvent extends BoardsEvent {
  final String name;

  const BoardsCreateEvent({required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}

final class BoardsListGetEvent extends BoardsEvent {
  const BoardsListGetEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

final class BoardDeleteEvent extends BoardsEvent {
  final int id;
  const BoardDeleteEvent({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
