import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kanban_task_managemant/application/bloc/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class DeleteBoardDialog extends StatefulWidget {
  // final int id;
  const DeleteBoardDialog({super.key});

  @override
  State<DeleteBoardDialog> createState() => _DeleteBoardDialogState();
}

class _DeleteBoardDialogState extends State<DeleteBoardDialog> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardsBloc, BoardsState>(builder: (context, state) {
      if (state is BoardsLoadingState) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (state is BoardsCompleteState) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          title: Text(
            "Delete this board?",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Are you sure you want to delete the ‘${state.boardList![0].title}’ board? This action will remove all columns and tasks and cannot be reversed.",
                style: const TextStyle(
                  color: Color(0xFF828FA3),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.77,
                ),
              ),
              addHeigth(24),
              ElevatedButton(
                onPressed: () async {
                  // print(_iddbService.idBox!.values.length);
                  context.read<BoardsBloc>().add(
                        BoardDeleteEvent(id: 0),
                      );
                  Fluttertoast.showToast(
                      msg: "jijktgjnrjgnkjrt",
                      timeInSecForIosWeb: 2,
                      backgroundColor: Colors.green);
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
                  ))),
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
