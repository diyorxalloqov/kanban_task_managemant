part of 'boards_bloc.dart';

@immutable
abstract class BoardsState extends Equatable {}

class BoardsInitialState extends BoardsState {
  @override
  List<Object?> get props => [];
}

class BoardsLoadingState extends BoardsState {
  @override
  List<Object?> get props => [];
}

class BoardsErrorState extends BoardsState {
  final String? errorMessage;
  final String? errorMessageBoardList;
  final String? deleteErorMessage;

  BoardsErrorState({this.errorMessage, this.errorMessageBoardList, this.deleteErorMessage});

  @override
  List<Object?> get props => [errorMessage, errorMessageBoardList, errorMessage];
}

class BoardsCompleteState extends BoardsState {
  final CreateBoardsModel? data;
  final List<BoardsListModel>? boardList;
  final String? deleteMessage;

  BoardsCompleteState({this.data, this.boardList, this.deleteMessage});

  @override
  List<Object?> get props => [data, boardList, deleteMessage];
}
