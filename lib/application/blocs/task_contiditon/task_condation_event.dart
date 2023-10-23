part of 'task_condation_bloc.dart';

@immutable
sealed class TaskCondationEvent extends Equatable {
  const TaskCondationEvent();

  @override
  List<Object> get props => [];
}

final class TaskConditionCreateEvent extends TaskCondationEvent {
  final String title;
  final int id;

  const TaskConditionCreateEvent(this.title, this.id);

  @override
  // TODO: implement props
  List<Object> get props => [title, id];
}

final class TaskConditionUpdateEvent extends TaskCondationEvent {
  final String title;
  final int id;

  const TaskConditionUpdateEvent(this.title, this.id);

  @override
  // TODO: implement props
  List<Object> get props => [title, id];
}
