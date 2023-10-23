part of 'task_condation_bloc.dart';

@immutable
sealed class TaskConditionState extends Equatable {
  const TaskConditionState();
}

final class TaskConditionInitialState extends TaskConditionState {
  const TaskConditionInitialState();
  @override
  List<Object?> get props => [];
}

final class TaskConditionLoadingState extends TaskConditionState {
  @override
  List<Object?> get props => [];
}

final class TaskConditionErrorState extends TaskConditionState {
  final String? taskConditionCreateErrorMessage;
  final String? taskCondititonPutErrorMessage;

  const TaskConditionErrorState(
      {this.taskConditionCreateErrorMessage,
      this.taskCondititonPutErrorMessage});

  @override
  List<Object?> get props =>
      [taskConditionCreateErrorMessage, taskCondititonPutErrorMessage];
}

final class TaskConditionCompleteState extends TaskConditionState {
  final String? createtaskConditionMessage;
  final String? taskCondititonPutMessage;

  const TaskConditionCompleteState(
      {this.createtaskConditionMessage, this.taskCondititonPutMessage});

  @override
  List<Object?> get props =>
      [createtaskConditionMessage, taskCondititonPutMessage];
}
