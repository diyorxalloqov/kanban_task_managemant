part of 'boards_bloc.dart';

@immutable
abstract class BoardsState extends Equatable {
  const BoardsState();
}

final class BoardsInitialState extends BoardsState {
  const BoardsInitialState();

  @override
  List<Object?> get props => [];
}

final class BoardsLoadingState extends BoardsState {
  const BoardsLoadingState();
  @override
  List<Object?> get props => [];
}

final class BoardsErrorState extends BoardsState {
  final String? errorMessage;
  final String? errorMessageBoardList;
  final String? deleteErorMessage;
  final String? putErrorMessage;

  const BoardsErrorState(
      {this.errorMessage,
      this.errorMessageBoardList,
      this.deleteErorMessage,
      this.putErrorMessage});

  @override
  List<Object?> get props =>
      [errorMessage, errorMessageBoardList, errorMessage, putErrorMessage];
}

final class BoardsCompleteState extends BoardsState {
  final CreateBoardsModel? data;
  final List<BoardsListModel>? boardList;
  final String? deleteMessage;
  final String? putMessage;

  const BoardsCompleteState(
      {this.data, this.boardList, this.deleteMessage, this.putMessage});

  @override
  List<Object?> get props => [data, boardList, deleteMessage, putMessage];
}
