// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/application/blocs/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/application/blocs/task_contiditon/task_condation_bloc.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class AddNewColumnDialog extends StatefulWidget {
  final int currentIndex;
  const AddNewColumnDialog({super.key, required this.currentIndex});

  @override
  State<AddNewColumnDialog> createState() => _AddNewBoardDialogState();
}

class _AddNewBoardDialogState extends State<AddNewColumnDialog> {
  final TextEditingController _addNewColumnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "Add New Column",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: SizedBox(
        width: 343.w,
        height: 200.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addHeigth(10.h),
            const Text(
              "Board Columns",
              style: TextStyle(
                color: Color(0xFF828FA3),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            addHeigth(20.h),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: TextFormField(
                  controller: _addNewColumnController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
                IconButton(
                    onPressed: () {
                      _addNewColumnController.clear();
                      setState(() {});
                    },
                    icon: const Icon(Icons.cancel_outlined))
              ],
            ),
            addHeigth(25.h),
            ElevatedButton(
              onPressed: () {
                context.read<TaskCondationBloc>().add(TaskConditionCreateEvent(
                    _addNewColumnController.text,
                    (context.read<BoardsBloc>().state as BoardsCompleteState)
                        .boardList![widget.currentIndex]
                        .id!
                        .toInt()));
                print((context.read<BoardsBloc>().state as BoardsCompleteState)
                    .boardList![widget.currentIndex]
                    .id!
                    .toInt());
                Navigator.pop(context);
                setState(() {});
                context.read<BoardsBloc>().add(const BoardsListGetEvent());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade50,
                  fixedSize: Size(double.infinity, 45.h)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text("Add New Column"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
