// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kanban_task_managemant/domain/db/boardDb/saveIdDBService.dart';
import 'package:kanban_task_managemant/domain/model/board/boardsListModel.dart';
import 'package:kanban_task_managemant/domain/services/boards/board/boardService.dart';
import 'package:meta/meta.dart';

import 'package:kanban_task_managemant/domain/model/board/createBoardModel.dart';

part 'boards_event.dart';
part 'boards_state.dart';

class BoardsBloc extends Bloc<BoardsEvent, BoardsState> {
  BoardsBloc() : super(BoardsInitialState()) {
    on<BoardsCreateEvent>(postBoardName);
    on<BoardsListGetEvent>(getBoardsList);
    on<BoardDeleteEvent>(deleteBoard);
    add(BoardsListGetEvent());
  }

  final BoardService _boardService = BoardService();

  ////  create board qilgandan so'ng xato bor

  Future<void> postBoardName(
      BoardsCreateEvent event, Emitter<BoardsState> emit) async {
    emit(BoardsLoadingState());

    Either<String, CreateBoardsModel> response =
        await _boardService.createNewBoard(event.name);

    try {
      response.fold(
        (error) {
          emit(BoardsErrorState(errorMessage: error));
        },
        (data) async {
          // Save the ID to the database
          await IDDBService().writeToDB(data.id);
          await Future.delayed(Duration.zero);
          emit(BoardsCompleteState(data: data));
        },
      );
    } catch (e) {
      // Handle any exceptions here
      emit(BoardsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getBoardsList(
      BoardsListGetEvent event, Emitter<BoardsState> emit) async {
    emit(BoardsLoadingState());
    Either<String, List<BoardsListModel>> res =
        await _boardService.boardsListGet();

    res.fold((error) => emit(BoardsErrorState(errorMessageBoardList: error)),
        (data) => emit(BoardsCompleteState(boardList: data)));
  }

  Future<void> deleteBoard(
      BoardDeleteEvent event, Emitter<BoardsState> emit) async {
    // List<dynamic> id = IDDBService().idBox!.values.toList();
    // print(id);
    emit(BoardsLoadingState());

    Either<String, String> res =
        await _boardService.deleteBoardDetails(event.id);

    res.fold((error) => emit(BoardsErrorState(deleteErorMessage: error)),
        (data) => emit(BoardsCompleteState(deleteMessage: data)));
    print(res);
  }
}
