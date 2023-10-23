// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kanban_task_managemant/domain/model/board/boardsListModel.dart';
import 'package:kanban_task_managemant/domain/source/db/hive/auth/token/tokenDBservice.dart';
import 'package:kanban_task_managemant/domain/source/services/boards/board/boardService.dart';
import 'package:meta/meta.dart';

import 'package:kanban_task_managemant/domain/model/board/createBoardModel.dart';

part 'boards_event.dart';
part 'boards_state.dart';

class BoardsBloc extends Bloc<BoardsEvent, BoardsState> {
  BoardsBloc() : super(const BoardsInitialState()) {
    on<BoardsCreateEvent>(postBoardName);
    on<BoardsListGetEvent>(getBoardsList);
    on<BoardDeleteEvent>(deleteBoard);
    on<BoardPutEvent>(putBoard);
    add(const BoardsListGetEvent());
  }

  final BoardService _boardService = BoardService();

  ////  create board qilgandan so'ng xato bor     fixed corectly

  Future<void> postBoardName(
      BoardsCreateEvent event, Emitter<BoardsState> emit) async {
    emit(const BoardsLoadingState());

    Either<String, CreateBoardsModel> response =
        await _boardService.createNewBoard(event.name);

    try {
      await response.fold(
        (error) async {
          emit(BoardsErrorState(errorMessage: error));
        },
        (data) async {
          // Save the ID to the database
          // await IDDBService().writeToDB(data.id);
          await Future.delayed(Duration.zero);
          emit(BoardsCompleteState(data: data));
          add(const BoardsListGetEvent()); /////////////
        },
      );
    } catch (e) {
      emit(BoardsErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getBoardsList(
      BoardsListGetEvent event, Emitter<BoardsState> emit) async {
    emit(const BoardsLoadingState());

    final tokenDBService = TokenDBService();
    await tokenDBService.openBox();

    final tokenData = tokenDBService.token?.get("token");
    if (tokenData == null || tokenData["accessToken"] == null) {
      emit(
          const BoardsErrorState(errorMessageBoardList: "Server ishlamayapti"));
      return;
    }

    final accessToken = tokenData["accessToken"].toString();

    Either<String, List<BoardsListModel>> res =
        await _boardService.boardsListGet(accessToken);

    res.fold((error) => emit(BoardsErrorState(errorMessageBoardList: error)),
        (data) => emit(BoardsCompleteState(boardList: data)));
  }

  Future<void> deleteBoard(
      BoardDeleteEvent event, Emitter<BoardsState> emit) async {
    emit(const BoardsLoadingState());

    Either<String, String> res =
        await _boardService.deleteBoardDetails(event.id);

    res.fold((error) => emit(BoardsErrorState(deleteErorMessage: error)),
        (message) => emit(BoardsCompleteState(deleteMessage: message)));

    add(const BoardsListGetEvent()); /////////////
  }

  Future<void> putBoard(BoardPutEvent event, Emitter<BoardsState> emit) async {
    emit(const BoardsLoadingState());
    Either<String, String> res =
        await _boardService.putBoardDetails(event.id, event.newTitle);
    res.fold((error) => emit(BoardsErrorState(putErrorMessage: error)),
        (message) => emit(BoardsCompleteState(putMessage: message)));

    add(const BoardsListGetEvent());
  }
}


////// boards toliq bitti xato toast message da null kelyapti