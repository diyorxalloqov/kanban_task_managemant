import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/source/services/tasks/task_item_condition/taskCondationService.dart';

part 'task_condation_event.dart';
part 'task_condation_state.dart';

class TaskCondationBloc extends Bloc<TaskCondationEvent, TaskConditionState> {
  TaskCondationBloc() : super(const TaskConditionInitialState()) {
    on<TaskConditionCreateEvent>(createTaskCondition);
  }

  final TaskCondationService _taskCondationService = TaskCondationService();

  Future<void> createTaskCondition(
      TaskConditionCreateEvent event, Emitter<TaskConditionState> emit) async {
    emit(TaskConditionLoadingState());

    Either<String, String> res =
        await _taskCondationService.taskItemCreate(event.title, event.id);
    res.fold(
        (l) =>
            emit(TaskConditionErrorState(taskConditionCreateErrorMessage: l)),
        (r) => TaskConditionCompleteState(createtaskConditionMessage: r));
  }

  Future<void> updateTaskCondition(
      TaskConditionUpdateEvent event, Emitter<TaskConditionState> emit) async {
    Either<String, String> res =
        await _taskCondationService.taskItemPut(event.title, event.id);
    res.fold(
        (l) => emit(TaskConditionErrorState(taskCondititonPutErrorMessage: l)),
        (r) => emit(TaskConditionCompleteState(taskCondititonPutMessage: r)));
  }
}
