import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kanban_task_managemant/application/bloc/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

// ignore: must_be_immutable
class DeleteBoardDialog extends StatelessWidget {
  int currentIndex;
  DeleteBoardDialog({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardsBloc, BoardsState>(builder: (context, state) {
      if (state is BoardsCompleteState) {
        final boardList = state.boardList;
        if (boardList != null && boardList.length > currentIndex) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            title: Text(
              "Delete this board?",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Are you sure you want to delete the ‘${state.boardList![currentIndex].title}’ board? This action will remove all columns and tasks and cannot be reversed.",
                  style: TextStyle(
                    color: const Color(0xFF828FA3),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.77.h,
                  ),
                ),
                addHeigth(24),
                ElevatedButton(
                  onPressed: () async {
                    context.read<BoardsBloc>().add(BoardDeleteEvent(
                        id: state.boardList![currentIndex].id!.toInt()));
                    Fluttertoast.showToast(
                        webPosition: "center",
                        msg: state.deleteMessage.toString(),
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.green);
                    context.read<BoardsBloc>().add(const BoardsListGetEvent());
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEA5555),
                      fixedSize: const Size(295, 40)),
                  child: const Center(
                    child: Text(
                      'Delete',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        height: 1.77,
                      ),
                    ),
                  ),
                ),
                addHeigth(16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 0, fixedSize: const Size(295, 40)),
                  child: const Center(
                    child: Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF635FC7),
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        height: 1.77,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          // print(boardList!.length);
          return const Center(
            child: Text("xatolik"),
          );
        }
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
