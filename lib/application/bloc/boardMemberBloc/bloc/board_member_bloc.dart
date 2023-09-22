import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'board_member_event.dart';
part 'board_member_state.dart';

class BoardMemberBloc extends Bloc<BoardMemberEvent, BoardMemberState> {
  BoardMemberBloc() : super(BoardMemberInitial()) {
    on<BoardMemberEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
