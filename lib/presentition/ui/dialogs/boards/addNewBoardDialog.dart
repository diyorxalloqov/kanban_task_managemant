// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/application/bloc/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class AddNewBoardDialog extends StatefulWidget {
  final int currentIndex;
  const AddNewBoardDialog({super.key, required this.currentIndex});

  @override
  State<AddNewBoardDialog> createState() => _AddNewBoardDialogState();
}

class _AddNewBoardDialogState extends State<AddNewBoardDialog> {
  final TextEditingController _BoardNameController = TextEditingController();
  final TextEditingController _AddcolumnController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  late BoardsBloc _boardsBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Obtain the reference to the Bloc in didChangeDependencies
    _boardsBloc = context.read<BoardsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "Add New Board",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Board Name",
            style: TextStyle(
              color: const Color(0xFF828FA3),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          addHeigth(10.h),
          Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _BoardNameController,
                  decoration: const InputDecoration(
                      hintText: "e.g. Web Design",
                      border: OutlineInputBorder()),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Iltimos Board nomini yozing";
                    }
                    return null;
                  },
                ),
                addHeigth(24.h),
                Text(
                  "Board Columns",
                  style: TextStyle(
                    color: const Color(0xFF828FA3),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                addHeigth(8),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: _AddcolumnController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        )),
                        InkWell(
                          onTap: () {
                            _AddcolumnController.clear();
                          },
                          child: Row(
                            children: [
                              addWidth(15.w),
                              const Icon(Icons.cancel_outlined),
                            ],
                          ),
                        ),
                      ],
                    ),
                    addHeigth(12),
                  ],
                ),
              ],
            ),
          ),
          addHeigth(12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade50,
                fixedSize: Size(double.infinity, 45.h)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF635FC7)
                        : null),
                Text(
                  "Add New Column",
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF635FC7)
                          : null),
                ),
              ],
            ),
          ),
          addHeigth(18.h),
          ElevatedButton(
            onPressed: () async {
              if (_key.currentState!.validate()) {
                Future.delayed(Duration.zero).then((value) => context
                    .read<BoardsBloc>()
                    .add(BoardsCreateEvent(name: _BoardNameController.text)));
                Future.delayed(Duration.zero)
                    .then((value) => Navigator.pop(context));
                setState(() {});

                context.read<BoardsBloc>().add(const BoardsListGetEvent());
              }
              // if (_AddcolumnController.text.isNotEmpty) {
              //   context.read<TaskCondationBloc>().add(TaskConditionCreateEvent(
              //       _AddcolumnController.text,
              //       (context.read<BoardsBloc>().state as BoardsCompleteState)
              //           .boardList![widget.currentIndex]
              //           .id!
              //           .toInt()));
              //   context.read<BoardsBloc>().add(const BoardsListGetEvent());
              // }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff635FC7),
                fixedSize: Size(context.height.h, 40.w)),
            child: Text(
              "Create New Board",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
