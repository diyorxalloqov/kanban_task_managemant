part of 'board_member_bloc.dart';

sealed class BoardMemberState extends Equatable {
  const BoardMemberState();
  
  @override
  List<Object> get props => [];
}

final class BoardMemberInitial extends BoardMemberState {}
