import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/application/blocs/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/expension_tile_widget.dart';

class AddNewTaskDialog extends StatefulWidget {
  final int taskConditionid;
  final int taskId;
  final int currenIndex;
  final BoardsCompleteState state;
  const AddNewTaskDialog({
    super.key,
    required this.state,
    required this.currenIndex,
    required this.taskConditionid,
    required this.taskId,
  });

  @override
  State<AddNewTaskDialog> createState() => _AddNewTaskDialogState();
}

class _AddNewTaskDialogState extends State<AddNewTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      alignment: Alignment.topCenter,
      insetPadding: const EdgeInsets.only(top: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: const Text(
        "Add New Task",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
      ),
      content: SizedBox(
        height: 730.h,
        width: 320.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addHeigth(10),
              const Text("Title"),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "e.g. Take coffee break",
                      hintStyle: TextStyle(),
                      border: OutlineInputBorder()),
                ),
              ),
              addHeigth(15),
              const Text("Description"),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                      isCollapsed: false,
                      hintText:
                          "e.g. It’s always good to take a break. This 15 minute break will  recharge the batteries a little.",
                      hintStyle: TextStyle(),
                      border: OutlineInputBorder()),
                ),
              ),
              addHeigth(15),
              const Text("Subtask"),
              addHeigth(10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "e.g. Make Coffee",
                          hintStyle: TextStyle(),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
                ],
              ),
              addHeigth(12),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "e.g. Drink coffee & smile",
                          hintStyle: TextStyle(),
                          border: OutlineInputBorder()),
                    ),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
                ],
              ),
              addHeigth(12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.infinity, 45)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text("Add New Subtask"),
                  ],
                ),
              ),
              addHeigth(15),
              const Text("Status"),
              addHeigth(10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ExpansionTileWidget(
                  list: [
                    "sss"
                  ],
                  // list: widget.state.boardList![widget.currenIndex].taskConditions!,
                ),
              ),
              addHeigth(10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff635FC7),
                    fixedSize: Size(context.height, 40)),
                child: const Text(
                  "Create Task",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
