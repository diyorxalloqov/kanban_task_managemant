part of 'boards_bloc.dart';

sealed class BoardsState extends Equatable {
  const BoardsState();
  
  @override
  List<Object> get props => [];
}

final class BoardsInitialState extends BoardsState {
   const  BoardsInitialState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

final   class BoardsLoadingState extends BoardsState{
    const BoardsLoadingState();
  @override
  // TODO: implement props
  List<Object> get props => [];

}

final   class  BoardsErrorState  extends  BoardsState{
 final  String? errorMessage;
 final  String? errorListMessage;
 final  String?  deleteErrorMessage;

  const BoardsErrorState({this.errorMessage,this.errorListMessage,this.deleteErrorMessage});
  @override
  // TODO: implement props
  List<Object> get props => [{errorMessage,errorListMessage,deleteErrorMessage}];
}

final class  BoardsCompleteState extends BoardsState{
  final  CreateBoardModel?  boardModel;
  final  List<BoardsListModel>? boardsListModel;
  final  String? deleteMessage;


  const  BoardsCompleteState({this.boardsListModel,this.boardModel,this.deleteMessage});
  @override
  // TODO: implement props
  List<Object> get props => [{boardModel,boardsListModel,deleteMessage}];

}