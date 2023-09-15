import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kanban_task_app/domain/db/id/Id_db_service.dart';
import 'package:kanban_task_app/domain/model/boardModel/boards_list_model.dart';
import 'package:kanban_task_app/domain/model/boardModel/create_board_model.dart';

import 'package:kanban_task_app/domain/services/boards/board_service.dart';

part 'boards_event.dart';
part 'boards_state.dart';

class BoardsBloc extends Bloc<BoardsEvent, BoardsState> {
  BoardsBloc() : super(const BoardsInitialState()) {
    on<BoardCreateEvent>(postBoardName);
    on<BoardsListGetEvent>(getBoardsList);
    on<BoardDeleteEvent>(deleteBoard);
  }
}


final BoardService  _boardService=BoardService();


Future<void>  postBoardName(BoardCreateEvent  event,Emitter<BoardsState>  emit) async{

     emit(BoardsLoadingState());
     Either< String, CreateBoardModel>  response=  await  _boardService.createService(event.name);

     final   data=response.getOrElse(() => CreateBoardModel());
     final   id=data.id;

     await  IdDBService().openBox();
    await  IdDBService().writeToDB(id!);


     response.fold((error) => emit(BoardsErrorState(errorMessage: error)),
                      (data) => emit(BoardsCompleteState(boardModel: data)));
   }



 Future<void>   getBoardsList(BoardsListGetEvent  event,Emitter<BoardsState> emit)  async{
        emit(const BoardsLoadingState());
        Either<String,List<BoardsListModel>>  res=await  _boardService.getBoardsList();
        
         res.fold((error) => emit(BoardsErrorState(errorListMessage: error)) , 
                   (data) => emit(BoardsCompleteState(boardsListModel: data)));
    }



 Future<void>  deleteBoard(BoardDeleteEvent  event, Emitter<BoardsState>  emit) async {
        List<dynamic>  id=IdDBService().idBox!.values.toList();
        print(id);

       Either<String,String>  res=await _boardService.deleteBoard(event.id);
        emit(BoardsLoadingState());
        res.fold( (error) =>emit(BoardsErrorState(deleteErrorMessage: error)),
              (dataMessage)=>emit(BoardsCompleteState(deleteMessage: dataMessage)));

        print(res);
        res;

       }
 
