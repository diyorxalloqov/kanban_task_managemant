import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/tasks/deleteTaskDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/dialogs/tasks/editTaskDialog.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class OnTapTaskDialog extends StatefulWidget {
  const OnTapTaskDialog({super.key});

  @override
  State<OnTapTaskDialog> createState() => _OnTapTaskDialogState();
}

class _OnTapTaskDialogState extends State<OnTapTaskDialog> {

  // statefullbuilder is removed because this page has separately context
  bool _isChechked = false;
  bool _isCheck = false;
  bool _isChecking = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(30),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Research pricing points of \nvarious competitors and trial \ndifferent business models",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge!.color,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'edit') {
                //edit board
                showDialog(
                    context: context,
                    builder: (context) => const EditTaskDialog());
              } else if (value == 'delete') {
                // delete board
                showDialog(
                    context: context,
                    builder: (context) => const DeleteTaskDialog());
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'edit',
                child: Text('Edit Task'),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text(
                  'Delete Task',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
            child: const Icon(Icons.more_vert),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "We know what we're planning to build for version one. Now we need to finalise the first pricing model we'll use. Keep iterating the subtasks until we have a coherent proposition."),
            addHeigth(24),
            Text(
              "Subtasks (2 of 3)",
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge!.color),
            ),
            addHeigth(16),
            SizedBox(
              height: 59.h,
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Row(
                  children: [
                    Checkbox(
                        value: _isChechked,
                        onChanged: (v) {
                          setState(
                            () {
                              _isChechked = v!;
                            },
                          );
                        }),
                    const Flexible(
                      child: Text(
                        "Research competitor pricing and business models",
                        style: TextStyle(overflow: TextOverflow.clip),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            addHeigth(8),
            SizedBox(
              height: 59.h,
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Row(
                  children: [
                    Checkbox(
                        value: _isCheck,
                        onChanged: (v) {
                          setState(() {
                            _isCheck = v!;
                          });
                        }),
                    const Flexible(
                      child: Text(
                        "Outline a business model that works for our solution",
                        style: TextStyle(overflow: TextOverflow.clip),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 59.h,
              width: double.infinity,
              child: Card(
                elevation: 0,
                child: Row(
                  children: [
                    Checkbox(
                        value: _isChecking,
                        onChanged: (v) {
                          setState(() {
                            _isChecking = v!;
                          });
                        }),
                    const Flexible(
                      child: Text(
                        "Surveying and testing",
                        style: TextStyle(overflow: TextOverflow.clip),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            addHeigth(context.height * 0.01),
            Text("Current Status"),
            addHeigth(10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ExpansionTile(
                iconColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color(0xff635FC7)
                    : const Color(0xff635FC7),
                shape: const BeveledRectangleBorder(),
                title: const Text("Hello"),
                children: const [
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
