import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class EditTaskDialog extends StatefulWidget {
  const EditTaskDialog({super.key});

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
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
        "Edit Task",
        style: TextStyle(
             fontSize: 18, fontWeight: FontWeight.w700),
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
                  decoration: InputDecoration(
                      hintText: "e.g. Take coffee break",
                      hintStyle: TextStyle(
                        color: const Color(0xFF000112).withOpacity(0.25),
                      ),
                      border: const OutlineInputBorder()),
                ),
              ),
              addHeigth(15),
              const Text("Description"),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      isCollapsed: false,
                      hintText:
                          "e.g. It’s always good to take a break. This 15 minute break will  recharge the batteries a little.",
                      hintStyle: TextStyle(
                        color: const Color(0xFF000112).withOpacity(0.25),
                      ),
                      border: const OutlineInputBorder()),
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
                      decoration: InputDecoration(
                          hintText: "e.g. Make Coffee",
                          hintStyle: TextStyle(
                            color: const Color(0xFF000112).withOpacity(0.25),
                          ),
                          border: const OutlineInputBorder()),
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
                      decoration: InputDecoration(
                          hintText: "e.g. Drink coffee & smile",
                          hintStyle: TextStyle(
                            color: const Color(0xFF000112).withOpacity(0.25),
                          ),
                          border: const OutlineInputBorder()),
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
                    backgroundColor: Colors.deepPurple.shade50,
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
                child: ExpansionTile(
                  shape: BeveledRectangleBorder(),
                  title: Text("Hello"),
                  children: [
                    Text("data"),
                    Text("data"),
                    Text("data"),
                  ],
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
